#!/usr/bin/env python3
"""
Local LLM Server (Ollama-compatible API)
使用 llama-cpp-python 启动本地 HTTP 服务，支持 Ollama 格式的 API

Usage:
    python scripts/llm_server.py

Requirements:
    pip install llama-cpp-python[server]

Model:
    assets/models/llm/qwen2.5-0.5b-instruct-q4_0.gguf
"""

import os
import sys
import json
from pathlib import Path

# Project root
PROJECT_ROOT = Path(__file__).parent.parent
DEFAULT_MODEL_PATH = str(PROJECT_ROOT / "assets" / "models" / "llm" / "qwen2.5-0.5b-instruct-q4_0.gguf")

# Server config
DEFAULT_HOST = "127.0.0.1"
DEFAULT_PORT = 11434  # Ollama default port


def check_model_exists(model_path: str) -> bool:
    """Check if model file exists"""
    if not os.path.exists(model_path):
        print(f"ERROR: Model file not found: {model_path}")
        print(f"Please ensure the model is downloaded.")
        return False
    size_mb = os.path.getsize(model_path) / (1024 * 1024)
    print(f"Model: {os.path.basename(model_path)} ({size_mb:.1f} MB)")
    return True


def start_server(model_path: str, host: str, port: int):
    """Start Ollama-compatible HTTP server"""
    from llama_cpp import Llama
    from llama_cpp.server import app, settings

    print(f"\n{'='*50}")
    print("Local LLM Server (Ollama-compatible)")
    print(f"{'='*50}")
    print(f"Server: http://{host}:{port}")
    print(f"Model: {os.path.basename(model_path)}")
    print(f"\nAPI Examples:")
    print(f"  # Chat completion")
    print(f"  curl -X POST http://{host}:{port}/api/chat \\")
    print(f"    -H 'Content-Type: application/json' \\")
    print(f"    -d '{{")
    print(f"      'model': 'qwen2.5:0.5b',")
    print(f"      'messages': [")
    print(f"        {{'role': 'user', 'content': '你好'}}")
    print(f"      ],")
    print(f"      'stream': false")
    print(f"    }}'")
    print(f"\n  # Check available models")
    print(f"  curl http://{host}:{port}/api/tags")
    print(f"{'='*50}\n")

    # Configure settings
    settings.model = model_path
    settings.host = host
    settings.port = port
    settings.n_gpu_layers = 0  # Set >0 for GPU acceleration
    settings.n_threads = 4
    settings.n_ctx = 2048
    settings.chat_format = "chatml"  # Qwen uses ChatML format

    import uvicorn
    uvicorn.run(app, host=host, port=port)


def main():
    import argparse
    parser = argparse.ArgumentParser(description="Local LLM Server (Ollama-compatible)")
    parser.add_argument("--model", type=str, default=DEFAULT_MODEL_PATH,
                       help="Path to GGUF model file")
    parser.add_argument("--host", type=str, default=DEFAULT_HOST,
                       help="Server host")
    parser.add_argument("--port", type=int, default=DEFAULT_PORT,
                       help="Server port (default: 11434)")
    parser.add_argument("--n-gpu-layers", type=int, default=0,
                       help="Number of GPU layers (0 = CPU only)")
    parser.add_argument("--threads", type=int, default=4,
                       help="Number of CPU threads")
    args = parser.parse_args()

    if not check_model_exists(args.model):
        sys.exit(1)

    start_server(args.model, args.host, args.port)


if __name__ == "__main__":
    main()
