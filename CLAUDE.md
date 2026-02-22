# CLAUDE.md

This repository is **Shiguang (拾光)**, a local-first AI memory app.

## Project Identity

- Product name: `Shiguang` / `拾光`
- Flutter package: `shiguang`
- Android applicationId / namespace: `com.sanbo.shiguang`
- iOS bundle id: `com.sanbo.shiguang`

## Core Principles

1. Local-first: user data, embeddings, and default inference stay on-device.
2. ObjectBox only: persistence and vector index are unified on ObjectBox.
3. Privacy boundary: optional web search is opt-in and must not upload private diary data.
4. Stability first: model reliability and deterministic behavior are higher priority than feature expansion.

## Current Architecture (Source of Truth)

- State: `flutter_riverpod`
- Routing: `go_router`
- DB: `ObjectBox` (`LocalAccount`, `VectorDiary`, `LocalReminder`)
- ASR: SenseVoice (on-device ONNX / system / endpoint selectable)
- Embedding: on-device BGE ONNX (384-dim)
- Chat: local + remote provider abstraction
- Reminder scheduling: local notifications + timezone

## Commands

```bash
flutter pub get

dart run build_runner build --delete-conflicting-outputs

flutter test

dart analyze lib test

flutter run -d <device_id>
```

## Execution Tracker (Updated: 2026-02-22)

### Completed

- [x] Project package/bundle alignment to Shiguang (`com.sanbo.shiguang`)
- [x] Test imports aligned to `package:shiguang/...`
- [x] Timeline segmented markers for month/week/day-gap
- [x] Local embedding generation + semantic retrieval in timeline search
- [x] Retrieval tuning for voice-like long queries (dynamic thresholds + vector candidate fallback)
- [x] Network result in-app markdown preview (instead of direct external-page-only flow)
- [x] README aligned to ObjectBox-based architecture
- [x] Home switched to minimalist floating dock (`Search / AI / Add`) with center long-press voice entry
- [x] Search section labels clarified: 完整匹配（字符串匹配）/ 模糊匹配（向量匹配 / AI 理解）/ 网络匹配（网络爬虫 / 搜索 API）
- [x] Search fuzzy pipeline upgraded to real dual-path retrieval:
      vector similarity search + local AI-style semantic DB matcher (summary/tags/content token overlap + recency blend)
- [x] Detail page contrast hardening for dark mode (remove white-surface mismatch; strengthen text readability)
- [x] Edit entry action moved outside detail page into timeline cards (detail focuses on read/share)
- [x] Share flow upgraded to rendered diary poster image with light-style preview and explicit dual actions (Save + Share)
- [x] Share style sheet overflow fixed (`BOTTOM OVERFLOWED`) with scrollable constrained layout
- [x] Avatar crop save stability hardening (lower capture pressure + lifecycle guards to reduce black-screen risk)
- [x] `dart analyze lib test` and `flutter test` clean pass after above UI/share changes
- [x] Real-device smoke validation on Pixel 8 for timeline/detail/share/settings in dark & light modes (text contrast and layout checked)
- [x] Share export action verified on Pixel 8: tapping poster-share launches external target app with image payload
- [x] Settings info save smoke test (nickname dialog save) on Pixel 8: no black-screen regression observed
- [x] Text readability spot-checks completed via device screenshots for timeline/detail/share/settings/write/search (dark/light sampled)
- [x] Dark timeline palette tuned from near-pure-black to softer deep gray-blue; diary card separators strengthened (border/shadow/spacing/divider contrast)
- [x] Pixel 8 adb screenshot validation for timeline dark mode after above tuning (`adb exec-out screencap`)
- [x] Reproduced and cleared runtime red-screen assertion on Pixel 8 (`material.dart` shape/borderRadius) by full reinstall run; latest build no longer shows assertion in `adb logcat`
- [x] Manual launch validation via `adb shell am start -n com.sanbo.shiguang/.MainActivity` + screenshot confirmed normal timeline render (no red-screen)
- [x] Search fuzzy results upgraded with semantic excerpt highlighting (show best-matched local passage; fallback highlight for AI-understood hits)
- [x] Timeline dark-mode cards now include an outer light gray ring for clearer per-entry separation
- [x] Detail app bar restored with both actions: edit + share
- [x] Share poster restyled to long-image black-theme layout: large top date block, increased whitespace, softer body text tone, full text rendering, and bottom app logo/name
- [x] Share poster layout normalized to strict three-zone structure: top calendar-style date, body full text, and centered bottom logo + app name
- [x] Share poster design pass v2: enhanced calendar header panel, improved typography rhythm/whitespace, and neutralized bottom brand mark to avoid yellow-garbled visual artifacts
- [x] Share poster simplification pass: removed top-right "日记" badge and removed continuous date line in header; keep only calendar block +正文+底部品牌
- [x] Share bottom sheet UX upgrade: preview area expanded to ~2/3 screen height and actions split into two buttons (`保存` and `分享`)
- [x] Share export now fixed to light poster only (dark poster option removed per product direction)
- [x] Share poster visual pass aligned to reference sample: white paper card, bold calendar header typography, softer body copy tone, and centered brand footer
- [x] Share actions behavior updated: `保存` now writes image into system gallery; `分享` invokes platform share sheet with PNG file payload
- [x] Gallery save pipeline hardened: switched from `image_gallery_saver_plus` to `gal` (`Gal.putImageBytes`) with explicit permission check/request flow
- [x] Android storage compatibility tweak: `WRITE_EXTERNAL_STORAGE` maxSdk raised to 29 for legacy-path consistency
- [x] Gallery save stability fix v2: save now uses temp-file + `Gal.putImage(file.path)` (avoid large byte payload channel issues from `putImageBytes`)
- [x] Share poster readability/spacing refinement: increased whitespace between date block and body, darkened body text for legibility, and flattened content surface to a single background tone (reduced inner block/ring feel)
- [x] Share poster footer mark updated to alternative app logo asset for closer visual alignment
- [x] Share poster continuity pass: removed internal separator line, border/shadow segmentation, and extra outer capture padding to keep a full-bleed single-tone poster surface
- [x] Editor image insertion fix: image insert now anchors to captured cursor selection (block id + start/end) instead of forcing end-of-text; removed newline trimming that could shift insert position
- [x] Editor image insertion fix v2: anchor capture now prioritizes currently focused text block (focusNode) before fallback id, preventing insertion fallback-to-end when active block id is stale
- [x] Editor image insertion fix v3: maintain per-block last valid `TextSelection` via controller/focus listeners and use it as insertion anchor fallback when picker interaction invalidates live selection
- [x] Editor image insertion fix v4: add global recent insertion anchor tracking (focused-selection priority, recent-anchor fallback) and sync on tap/change to avoid fallback-to-end when toolbar interaction clears live selection
- [x] Editor image insertion fix v5: persist selection snapshot on focus gain/loss and tap-change cycles, then prioritize recent cursor anchor for image insertion to prevent insertion drifting to article end
- [x] Editor image insertion fix v6: stop overriding insertion anchor on text-field blur; keep last explicit cursor snapshot so toolbar image insertion does not drift to document tail
- [x] Editor rich-text usability upgrade: bold/italic/strikethrough now default to rich styled rendering in editor (markdown markers hidden from visual flow)
- [x] Editor markdown support upgrade: extended inline markdown rendering (`**`/`__` bold, `*`/`_` italic, `~~` strike, `` `code` ``) plus heading line support (`#`, `##`, `###`)
- [x] Rich-text input default switched to WYSIWYG hidden-style markers (selected text becomes bold/italic/strike directly, without visible markdown/html wrappers)
- [x] Diary display layer upgraded to render rich text in timeline card and detail page (bold/italic/strike/code/heading visualized after local save)
- [x] Rich-text parser compatibility extended to support both hidden markers and typed markdown/html syntax during rendering/decoding
- [x] Settings > About easter-egg flow: tapping "拾光" 7 times opens beta invite dialog ("输入内测邀请码") with intro copy + cancel/activate actions
- [x] Beta activation persistence: invite code and activation state stored in settings secure storage and reflected in About subtitle
- [x] Build/deploy validation this round: formatted code, targeted `dart analyze` passed, `flutter test` passed, and debug build installed/launched on device `986b35a0`

### In Progress

- [ ] Semantic retrieval quality for voice input (further recall/precision tuning + dataset-based eval)
- [ ] Small-model stability hardening (anti-drift prompts, regression set, quality gates)
- [ ] Minimalist UI alignment pass against `imgs/` references (home/search/write/detail/share/settings)
- [ ] Dark-mode readability hardening (remove hard-coded colors; ensure list/info contrast is readable on real device)
- [ ] Real-device validation after each UI milestone (where device connection is available)

### Deferred by Product Direction

- [ ] RAG rollout (paused until model stability KPI is met)
- [ ] AI-driven reminder extraction + urgency/priority policy engine
- [ ] Reminder policy: urgent/high -> alarm, normal -> calendar reminder schedule

### Planned (High Priority)

- [ ] External retrieval provider upgrade path toward DDGS-oriented pipeline
- [ ] Search result payload normalization to structured title/content markdown chunks
- [ ] Knowledge pipeline standardization: model selection -> embedding schema -> KB binding -> AI summary/analysis/reminder

### Planned (Later, Not This Sprint)

- [ ] Re-introduce "On This Day / Time Reading" after minimalist baseline is stable
- [ ] Re-introduce Calendar module (stats + monthly views) after core home/search/write polish is completed
- [ ] Reminder pipeline upgrade after model stability milestone (AI extraction + urgency policy automation)

### UI Baseline (Current Sprint Constraint)

- Use minimalist black/white + light-gray palette only; avoid beige/yellow surfaces.
- Keep structure and interaction rhythm aligned with reference products, but do not clone their full visual theme.

## UI Alignment Tasks (imgs baseline)

1. Home timeline
   - Keep date-based separators as primary visual structure.
   - Remove heavy dividers and increase whitespace density.
2. Search/AI
   - Keep unified entry under one module with lightweight AI entry card.
3. Write/Publish
   - Preserve ASR core pipeline; only restyle to minimalist paper layout.
   - Keyboard-adjacent toolbar includes mic mode switch.
4. Detail + Share
   - Detail page and share card are both minimalist with paper-like spacing and lighter chrome.
5. Deferred modules (not in current build)
   - Calendar/Stats and On This Day are intentionally hidden for now.

## Product Direction Notes

1. Timeline should feel temporal, not flat list: preserve visual time segmentation and long-gap awareness.
2. Search quality is judged on real voice-input queries, not only typed queries.
3. Reminder creation should move from manual-first to **AI-suggest + user confirm** workflow.
4. RAG is not the immediate milestone; model correctness and controllability come first.

## Documentation References

- `README.md`
- `docs/SPEC.md`
- `docs/COMPARISON_MATRIX.md`
- `docs/I18N.md`
