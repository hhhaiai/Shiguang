#!/usr/bin/env python3
"""Generate the Shiguang app icon from CLAUDE.md semantics.

Concept encoded in the mark:
- Shield: local-first privacy and account isolation.
- Clock ring + hand: "time" and diary timeline memory.
- Spark + orbit dots: captured fragments of light/ideas.
- Bottom cradle strokes: "拾" (pick up / collect) gesture.
"""

from __future__ import annotations

import argparse
import struct
import subprocess
import zlib
from pathlib import Path

import numpy as np

ROOT = Path(__file__).resolve().parents[1]
MASTER_ICON = ROOT / "assets/branding/shiguang_app_icon_1024.png"
BRANDING_DIR = ROOT / "assets/branding"
VARIANTS = ("aurora", "minimal", "sunrise")

THEMES: dict[str, dict[str, object]] = {
    "aurora": {
        "bg_top": [0.06, 0.20, 0.29],
        "bg_bottom": [0.03, 0.11, 0.20],
        "glow_left": [0.05, 0.23, 0.19],
        "glow_right": [0.24, 0.16, 0.04],
        "vignette": 0.25,
        "grain": 0.008,
        "aura_color": [0.86, 0.95, 0.93],
        "aura_alpha": 0.20,
        "shield_inner": [0.93, 0.98, 0.97],
        "shield_warm": [1.00, 0.98, 0.92],
        "shield_ring": [0.99, 0.96, 0.88],
        "clock_ring": [0.99, 0.84, 0.45],
        "hand": [1.00, 0.92, 0.66],
        "center": [1.00, 0.96, 0.80],
        "spark": [1.00, 0.94, 0.70],
        "dots": [
            [1.00, 0.86, 0.52],
            [0.69, 0.94, 0.87],
            [1.00, 0.94, 0.75],
        ],
        "cradle": [0.67, 0.95, 0.88],
    },
    "minimal": {
        "bg_top": [0.10, 0.12, 0.18],
        "bg_bottom": [0.05, 0.06, 0.10],
        "glow_left": [0.02, 0.08, 0.10],
        "glow_right": [0.13, 0.10, 0.06],
        "vignette": 0.35,
        "grain": 0.004,
        "aura_color": [0.85, 0.88, 0.93],
        "aura_alpha": 0.12,
        "shield_inner": [0.89, 0.92, 0.97],
        "shield_warm": [0.90, 0.92, 0.95],
        "shield_ring": [0.93, 0.95, 0.98],
        "clock_ring": [0.84, 0.88, 0.99],
        "hand": [0.96, 0.97, 1.00],
        "center": [0.98, 0.99, 1.00],
        "spark": [0.99, 0.90, 0.62],
        "dots": [
            [0.80, 0.90, 1.00],
            [0.90, 0.98, 0.97],
            [1.00, 0.93, 0.72],
        ],
        "cradle": [0.74, 0.90, 0.97],
    },
    "sunrise": {
        "bg_top": [0.30, 0.13, 0.18],
        "bg_bottom": [0.16, 0.06, 0.12],
        "glow_left": [0.32, 0.17, 0.08],
        "glow_right": [0.46, 0.26, 0.08],
        "vignette": 0.22,
        "grain": 0.007,
        "aura_color": [1.00, 0.91, 0.79],
        "aura_alpha": 0.24,
        "shield_inner": [1.00, 0.95, 0.88],
        "shield_warm": [1.00, 0.90, 0.70],
        "shield_ring": [1.00, 0.86, 0.60],
        "clock_ring": [1.00, 0.74, 0.35],
        "hand": [1.00, 0.88, 0.58],
        "center": [1.00, 0.93, 0.70],
        "spark": [1.00, 0.96, 0.77],
        "dots": [
            [1.00, 0.78, 0.40],
            [0.95, 0.92, 0.70],
            [1.00, 0.86, 0.57],
        ],
        "cradle": [1.00, 0.84, 0.62],
    },
}


def save_png_rgba(path: Path, rgba: np.ndarray) -> None:
    """Write a uint8 RGBA image to PNG using only stdlib."""
    h, w, c = rgba.shape
    if c != 4:
        raise ValueError("RGBA image expected")

    # PNG filter type 0 (None) per scanline
    raw = b"".join(b"\x00" + rgba[y].tobytes() for y in range(h))
    compressed = zlib.compress(raw, level=9)

    def chunk(tag: bytes, data: bytes) -> bytes:
        crc = zlib.crc32(tag + data) & 0xFFFFFFFF
        return struct.pack(">I", len(data)) + tag + data + struct.pack(">I", crc)

    ihdr = struct.pack(">IIBBBBB", w, h, 8, 6, 0, 0, 0)  # 8-bit RGBA

    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("wb") as f:
        f.write(b"\x89PNG\r\n\x1a\n")
        f.write(chunk(b"IHDR", ihdr))
        f.write(chunk(b"IDAT", compressed))
        f.write(chunk(b"IEND", b""))


def smooth_alpha(sd: np.ndarray, feather: float) -> np.ndarray:
    """Convert signed distance to anti-aliased alpha."""
    return np.clip(0.5 - sd / feather, 0.0, 1.0)


def segment_distance(
    px: np.ndarray,
    py: np.ndarray,
    ax: float,
    ay: float,
    bx: float,
    by: float,
) -> np.ndarray:
    ex = bx - ax
    ey = by - ay
    wx = px - ax
    wy = py - ay
    dot_ee = ex * ex + ey * ey + 1e-8
    t = np.clip((wx * ex + wy * ey) / dot_ee, 0.0, 1.0)
    dx = wx - ex * t
    dy = wy - ey * t
    return np.sqrt(dx * dx + dy * dy)


def polygon_sdf(px: np.ndarray, py: np.ndarray, verts: list[tuple[float, float]]) -> np.ndarray:
    """Signed distance to polygon. Negative inside, positive outside."""
    n = len(verts)
    d2 = np.full(px.shape, 1e9, dtype=np.float32)
    inside = np.zeros(px.shape, dtype=bool)

    for i in range(n):
        ax, ay = verts[i]
        bx, by = verts[(i + 1) % n]

        # Distance to edge segment
        ex = bx - ax
        ey = by - ay
        wx = px - ax
        wy = py - ay
        dot_ee = ex * ex + ey * ey + 1e-8
        t = np.clip((wx * ex + wy * ey) / dot_ee, 0.0, 1.0)
        dx = wx - ex * t
        dy = wy - ey * t
        d2 = np.minimum(d2, dx * dx + dy * dy)

        # Ray crossing for inside test
        crossings = ((ay > py) != (by > py)) & (
            px < ((bx - ax) * (py - ay) / (by - ay + 1e-8) + ax)
        )
        inside ^= crossings

    sign = np.where(inside, -1.0, 1.0).astype(np.float32)
    return np.sqrt(d2) * sign


def overlay(base: np.ndarray, color: np.ndarray, alpha: np.ndarray) -> np.ndarray:
    """Alpha-over a solid color onto RGB image."""
    a = np.clip(alpha, 0.0, 1.0)[..., None]
    return base * (1.0 - a) + color[None, None, :] * a


def c(theme: dict[str, object], key: str) -> np.ndarray:
    return np.array(theme[key], dtype=np.float32)


def generate_master_icon(size: int = 1024, variant: str = "aurora") -> np.ndarray:
    if variant not in THEMES:
        raise ValueError(f"Unknown variant: {variant}")
    theme = THEMES[variant]

    xs = np.linspace(-1.0, 1.0, size, dtype=np.float32)
    ys = np.linspace(-1.0, 1.0, size, dtype=np.float32)
    x, y = np.meshgrid(xs, ys)

    # Background: deep ocean-teal gradient + warm sunrise glow
    c_top = c(theme, "bg_top")
    c_bottom = c(theme, "bg_bottom")
    t = np.clip((y + 1.0) * 0.5, 0.0, 1.0)
    bg = c_top[None, None, :] * (1.0 - t[..., None]) + c_bottom[None, None, :] * t[..., None]

    teal_glow = np.exp(-(((x + 0.55) / 0.95) ** 2 + ((y - 0.45) / 0.75) ** 2))
    amber_glow = np.exp(-(((x - 0.34) / 0.58) ** 2 + ((y + 0.56) / 0.52) ** 2))
    bg += teal_glow[..., None] * c(theme, "glow_left")
    bg += amber_glow[..., None] * c(theme, "glow_right")

    vignette = np.clip(1.0 - float(theme["vignette"]) * (x * x + y * y), 0.72, 1.0)
    img = np.clip(bg * vignette[..., None], 0.0, 1.0)

    # Subtle texture to avoid flatness at large sizes
    grain = (
        np.sin(x * 39.0 + y * 11.0) + np.sin(y * 57.0 - x * 7.0) + np.sin((x + y) * 33.0)
    ) / 3.0
    img = np.clip(img + grain[..., None] * float(theme["grain"]), 0.0, 1.0)

    # Soft aura behind emblem
    aura = np.exp(-(((x - 0.02) / 0.70) ** 2 + ((y + 0.02) / 0.68) ** 2))
    img = overlay(img, c(theme, "aura_color"), float(theme["aura_alpha"]) * aura)

    # Shield polygon (privacy/local-first)
    shield = [
        (-0.38, -0.20),
        (-0.27, -0.40),
        (0.00, -0.50),
        (0.27, -0.40),
        (0.38, -0.20),
        (0.33, 0.20),
        (0.00, 0.56),
        (-0.33, 0.20),
    ]
    shield_inner = [(vx * 0.80, vy * 0.80 + 0.01) for vx, vy in shield]

    sd_shield = polygon_sdf(x, y, shield)
    sd_shield_inner = polygon_sdf(x, y, shield_inner)

    outer_a = smooth_alpha(sd_shield, 0.009)
    inner_a = smooth_alpha(sd_shield_inner, 0.009)
    ring_a = np.clip(outer_a - inner_a, 0.0, 1.0)

    fill_grad = np.clip((-(y + 0.52)) / 1.2, 0.0, 1.0)
    img = overlay(img, c(theme, "shield_inner"), 0.12 * inner_a)
    img = overlay(img, c(theme, "shield_warm"), 0.10 * inner_a * fill_grad)
    img = overlay(img, c(theme, "shield_ring"), 0.95 * ring_a)

    # Clock ring (time/memory timeline)
    clock_cx, clock_cy = 0.0, -0.02
    clock_r = 0.19
    sd_clock = np.abs(np.sqrt((x - clock_cx) ** 2 + (y - clock_cy) ** 2) - clock_r) - 0.024
    clock_a = smooth_alpha(sd_clock, 0.006)
    img = overlay(img, c(theme, "clock_ring"), 0.92 * clock_a)

    # Clock hands
    hand_main = segment_distance(x, y, 0.0, -0.02, 0.11, -0.12) - 0.017
    hand_minor = segment_distance(x, y, 0.0, -0.02, 0.00, -0.15) - 0.010
    hand_a = np.maximum(smooth_alpha(hand_main, 0.006), smooth_alpha(hand_minor, 0.006))
    img = overlay(img, c(theme, "hand"), 0.95 * hand_a)

    center_dot = np.sqrt((x - 0.0) ** 2 + (y + 0.02) ** 2) - 0.025
    center_a = smooth_alpha(center_dot, 0.006)
    img = overlay(img, c(theme, "center"), 0.92 * center_a)

    # Spark (light)
    spark_color = c(theme, "spark")
    spark = np.zeros_like(x)
    spark = np.maximum(spark, smooth_alpha(segment_distance(x, y, 0.23, -0.22, 0.33, -0.22) - 0.010, 0.005))
    spark = np.maximum(spark, smooth_alpha(segment_distance(x, y, 0.28, -0.27, 0.28, -0.17) - 0.010, 0.005))
    spark = np.maximum(spark, smooth_alpha(segment_distance(x, y, 0.245, -0.255, 0.315, -0.185) - 0.008, 0.005))
    spark = np.maximum(spark, smooth_alpha(segment_distance(x, y, 0.245, -0.185, 0.315, -0.255) - 0.008, 0.005))
    spark_glow = np.exp(-(((x - 0.28) / 0.10) ** 2 + ((y + 0.22) / 0.10) ** 2))
    img = overlay(img, spark_color, 0.95 * spark)
    img = overlay(img, spark_color, 0.25 * spark_glow)

    # Fragment dots on an orbit
    dot_colors = [np.array(v, dtype=np.float32) for v in theme["dots"]]  # type: ignore[index]
    dots = [
        (-0.28, -0.56, 0.040, dot_colors[0]),
        (0.00, -0.62, 0.034, dot_colors[1]),
        (0.28, -0.56, 0.040, dot_colors[2]),
    ]
    for cx, cy, r, color in dots:
        sd = np.sqrt((x - cx) ** 2 + (y - cy) ** 2) - r
        da = smooth_alpha(sd, 0.006)
        glow = np.exp(-(((x - cx) / (r * 2.6)) ** 2 + ((y - cy) / (r * 2.6)) ** 2))
        img = overlay(img, color, 0.96 * da)
        img = overlay(img, color, 0.16 * glow)

    # Bottom cradle strokes ("pick up" gesture)
    cradle_color = c(theme, "cradle")
    left_arm = smooth_alpha(segment_distance(x, y, -0.34, 0.45, -0.10, 0.53) - 0.035, 0.007)
    right_arm = smooth_alpha(segment_distance(x, y, 0.34, 0.45, 0.10, 0.53) - 0.035, 0.007)
    base_arm = smooth_alpha(segment_distance(x, y, -0.16, 0.57, 0.16, 0.57) - 0.026, 0.006)
    cradle = np.maximum(np.maximum(left_arm, right_arm), base_arm)
    cradle_glow = np.exp(-(((x - 0.0) / 0.48) ** 2 + ((y - 0.54) / 0.17) ** 2))
    img = overlay(img, cradle_color, 0.90 * cradle)
    img = overlay(img, cradle_color, 0.18 * cradle_glow)

    # Final clamp and full alpha
    img = np.clip(img, 0.0, 1.0)
    rgba = np.zeros((size, size, 4), dtype=np.uint8)
    rgba[..., :3] = (img * 255.0 + 0.5).astype(np.uint8)
    rgba[..., 3] = 255
    return rgba


def resize_png(src: Path, dst: Path, size: int) -> None:
    dst.parent.mkdir(parents=True, exist_ok=True)
    subprocess.run([
        "sips",
        "-s",
        "format",
        "png",
        "-z",
        str(size),
        str(size),
        str(src),
        "--out",
        str(dst),
    ], check=True, capture_output=True, text=True)


def apply_to_platform_icons(master: Path) -> None:
    # Android launcher icons
    android_sizes = {
        "android/app/src/main/res/mipmap-mdpi/ic_launcher.png": 48,
        "android/app/src/main/res/mipmap-hdpi/ic_launcher.png": 72,
        "android/app/src/main/res/mipmap-xhdpi/ic_launcher.png": 96,
        "android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png": 144,
        "android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png": 192,
    }

    # iOS AppIcon set (sizes from existing filenames)
    ios_sizes = {
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@1x.png": 20,
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@2x.png": 40,
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@3x.png": 60,
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@1x.png": 29,
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@2x.png": 58,
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@3x.png": 87,
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@1x.png": 40,
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@2x.png": 80,
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@3x.png": 120,
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@2x.png": 120,
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@3x.png": 180,
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@1x.png": 76,
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@2x.png": 152,
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5@2x.png": 167,
        "ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png": 1024,
    }

    # Web icons
    web_sizes = {
        "web/favicon.png": 32,
        "web/icons/Icon-192.png": 192,
        "web/icons/Icon-512.png": 512,
        "web/icons/Icon-maskable-192.png": 192,
        "web/icons/Icon-maskable-512.png": 512,
    }

    for rel, size in {**android_sizes, **ios_sizes, **web_sizes}.items():
        resize_png(master, ROOT / rel, size)


def generate_all_variants(size: int = 1024) -> None:
    generated: list[np.ndarray] = []

    for name in VARIANTS:
        rgba = generate_master_icon(size=size, variant=name)
        out = BRANDING_DIR / f"shiguang_app_icon_1024_{name}.png"
        save_png_rgba(out, rgba)
        generated.append(rgba)
        print(f"Generated variant: {out}")

    separator = np.full((size, 24, 4), fill_value=255, dtype=np.uint8)
    separator[..., :3] = 28
    preview = np.concatenate(
        [generated[0], separator, generated[1], separator, generated[2]],
        axis=1,
    )
    preview_path = BRANDING_DIR / "shiguang_app_icon_1024_variants_preview.png"
    save_png_rgba(preview_path, preview)
    print(f"Generated preview: {preview_path}")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Generate Shiguang app icon assets.")
    parser.add_argument(
        "--all-variants",
        action="store_true",
        help="Generate all icon variants and a preview strip.",
    )
    parser.add_argument(
        "--apply-variant",
        choices=VARIANTS,
        help="Generate one variant and apply it to Android/iOS/Web icon assets.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()

    if args.all_variants:
        generate_all_variants(size=1024)
        return

    variant = args.apply_variant if args.apply_variant else "aurora"
    rgba = generate_master_icon(size=1024, variant=variant)
    save_png_rgba(MASTER_ICON, rgba)
    apply_to_platform_icons(MASTER_ICON)
    print(f"Generated master icon ({variant}): {MASTER_ICON}")
    print("Applied icon to Android/iOS/Web assets.")


if __name__ == "__main__":
    main()
