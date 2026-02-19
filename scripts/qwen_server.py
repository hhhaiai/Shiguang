#!/usr/bin/env python3
"""
Local QWEN LLM Server
使用 llama-cpp-python 启动本地 WebSocket 服务

Usage:
    python scripts/qwen_server.py

Requirements:
    pip install llama-cpp-python[server] websockets

Model:
    assets/models/llm/qwen2.5-0.5b-instruct-q4_0.gguf
"""

import asyncio
import json
import os
import sys
import argparse
from pathlib import Path

# Add project root to path
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))

# Model path
DEFAULT_MODEL_PATH = str(project_root / "assets" / "models" / "llm" / "qwen2.5-0.5b-instruct-q4_0.gguf")

# Server config
DEFAULT_HOST = "127.0.0.1"
DEFAULT_PORT = 8080
DEFAULT_WS_PORT = 8081


def check_dependencies():
    """Check if required packages are installed"""
    try:
        import llama_cpp
        print(f"llama_cpp version: {llama_cpp.__version__}")
        return True
    except ImportError:
        print("ERROR: llama-cpp-python not installed")
        print("Install with: pip install llama-cpp-python[server]")
        return False


def get_model_path() -> str:
    """Get model path from argument or default"""
    parser = argparse.ArgumentParser(description="Local QWEN LLM Server")
    parser.add_argument("--model", type=str, default=DEFAULT_MODEL_PATH,
                       help="Path to GGUF model file")
    parser.add_argument("--host", type=str, default=DEFAULT_HOST,
                       help="Server host")
    parser.add_argument("--port", type=int, default=DEFAULT_PORT,
                       help="HTTP server port")
    parser.add_argument("--ws-port", type=int, default=DEFAULT_WS_PORT,
                       help="WebSocket server port")
    parser.add_argument("--n-gpu-layers", type=int, default=0,
                       help="Number of GPU layers (0 = CPU only)")
    parser.add_argument("--threads", type=int, default=4,
                       help="Number of CPU threads")
    args = parser.parse_args()

    # Check model file
    if not os.path.exists(args.model):
        print(f"ERROR: Model file not found: {args.model}")
        print(f"Please ensure the model is downloaded to: {DEFAULT_MODEL_PATH}")
        sys.exit(1)

    return args


async def handle_websocket(ws, model_path, args):
    """Handle WebSocket connections for chat"""
    from llama_cpp import Llama

    print(f"Loading model from: {model_path}")
    llm = Llama(
        model_path=model_path,
        n_gpu_layers=args.n_gpu_layers,
        n_threads=args.threads,
        n_ctx=2048,
        verbose=False,
    )
    print("Model loaded successfully!")

    try:
        async for message in ws:
            try:
                data = json.loads(message)
                messages = data.get("messages", [])
                max_tokens = data.get("max_tokens", 512)
                temperature = data.get("temperature", 0.7)
                stream = data.get("stream", False)

                # Convert messages to llama-cpp format
                chat_history = []
                for msg in messages:
                    role = msg.get("role", "user")
                    content = msg.get("content", "")
                    if role == "system":
                        chat_history.append({"role": "system", "content": content})
                    elif role == "user":
                        chat_history.append({"role": "user", "content": content})
                    elif role == "assistant":
                        chat_history.append({"role": "assistant", "content": content})

                if stream:
                    # Streaming response
                    await ws.send(json.dumps({"type": "start"}))

                    response = llm.create_chat_completion(
                        messages=chat_history,
                        max_tokens=max_tokens,
                        temperature=temperature,
                        stream=True,
                    )

                    full_content = ""
                    for chunk in response:
                        delta = chunk["choices"][0]["delta"]
                        if "content" in delta:
                            content = delta["content"]
                            full_content += content
                            await ws.send(json.dumps({
                                "type": "chunk",
                                "content": content
                            }))

                    await ws.send(json.dumps({
                        "type": "done",
                        "content": full_content
                    }))
                else:
                    # Non-streaming response
                    response = llm.create_chat_completion(
                        messages=chat_history,
                        max_tokens=max_tokens,
                        temperature=temperature,
                    )

                    content = response["choices"][0]["message"]["content"]
                    await ws.send(json.dumps({
                        "choices": [{
                            "message": {
                                "role": "assistant",
                                "content": content
                            }
                        }]
                    }))

            except json.JSONDecodeError:
                await ws.send(json.dumps({"error": "Invalid JSON"}))
            except Exception as e:
                await ws.send(json.dumps({"error": str(e)}))

    except Exception as e:
        print(f"WebSocket error: {e}")
    finally:
        print("Client disconnected")


async def start_websocket_server(model_path, args):
    """Start WebSocket server"""
    import websockets

    print(f"\n{'='*50}")
    print("Local QWEN LLM Server")
    print(f"{'='*50}")
    print(f"WebSocket: ws://{args.host}:{args.ws_port}")
    print(f"Model: {os.path.basename(model_path)}")
    print(f"GPU Layers: {args.n_gpu_layers}")
    print(f"CPU Threads: {args.threads}")
    print(f"{'='*50}\n")

    async with websockets.serve(
        lambda ws, path: handle_websocket(ws, model_path, args),
        args.host,
        args.ws_port,
    ):
        print(f"Server running. Press Ctrl+C to stop.")
        await asyncio.Future()  # Run forever


def start_http_server(model_path, args):
    """Start HTTP server using llama-cpp-python built-in server"""
    from llama_cpp.server import app, settings

    # Configure settings
    settings.model = model_path
    settings.host = args.host
    settings.port = args.port
    settings.n_gpu_layers = args.n_gpu_layers
    settings.n_threads = args.threads
    settings.n_ctx = 2048

    print(f"\n{'='*50}")
    print("Local QWEN LLM Server (HTTP)")
    print(f"{'='*50}")
    print(f"Server: http://{args.host}:{args.port}")
    print(f"Model: {os.path.basename(model_path)}")
    print(f"\nAPI Examples:")
    print(f"  curl -X POST http://{args.host}:{args.port}/v1/chat/completions \\")
    print(f"    -H 'Content-Type: application/json' \\")
    print(f"    -d '{{'")
    print(f"      'messages': [{{'role': 'user', 'content': '你好'}}],")
    print(f"      'max_tokens': 512")
    print(f"    }}'")
    print(f"{'='*50}\n")

    import uvicorn
    uvicorn.run(app, host=args.host, port=args.port)


def main():
    args = get_model_path()

    if not check_dependencies():
        sys.exit(1)

    print(f"\nUsing model: {args.model}")
    print(f"File size: {os.path.getsize(args.model) / (1024*1024):.1f} MB\n")

    # Try WebSocket first
    try:
        import websockets
        asyncio.run(start_websocket_server(args.model, args))
    except ImportError:
        print("websockets not installed, falling back to HTTP server")
        try:
            start_http_server(args.model, args)
        except ImportError:
            print("uvicorn not installed for HTTP server")
            print("Install with: pip install llama-cpp-python[server]")
            sys.exit(1)


if __name__ == "__main__":
    main()
