# AGENTS.md — Standing Rules for Penumbra Themes

This file is the standing agreement for anyone working on this repository — human or AI.
Read and follow these rules strictly before making any code modifications.

---

## Project Identity

| Key | Value |
|---|---|
| **Suite** | Penumbra Themes for Playnite |
| **Themes** | **Penumbra Dawn** (Desktop), **Penumbra Night** (Desktop), **Penumbra Blur** (Fullscreen) |
| **Repo** | `gOOvER/Penumbra-Themes` |
| **Framework** | WPF XAML / Playnite Desktop Theme API 2.9.0 |
| **Target App** | Playnite 10+ |

---

## 🎨 CRITICAL DESIGN RULE: Rounded Corners Everywhere (No Square Edges)

**ALL corners across all Penumbra themes MUST be rounded.** Sharp, 90-degree rectangular corners on interactive elements, containers, or headers are strictly prohibited.

### Guidelines:
1. **Controls & Buttons**:
   - Always use `CornerRadius="{DynamicResource ControlCornerRadius}"` (configured to **8px**) or explicit `CornerRadius="8"`.
   - Applies to: `Button`, `ToggleButton`, `TextBox`, `ComboBox`, `RadioButton`, `CheckBox`, `TopPanelItem`, `PlayButton`.
2. **Tabs (`TabItem`)**:
   - Tab headers must never be raw square rectangles.
   - Use top-rounded corners (`CornerRadius="8,8,0,0"` or `6,6,0,0"`) when tabs are on top, and matching directional curves for left/bottom/right placements.
3. **Containers & Cards**:
   - All content cards (Details sidebar, Reviews, Description, HLTB, SuccessStory, Activity, etc.) must use `CornerRadius="8"`.
   - Popups and dropdown menus must use rounded corners (`CornerRadius="8"` or `CornerRadius="0,0,8,8"`).
4. **Chips & Badges**:
   - `ChipPropertyItemButton` and notification badges must use rounded corners (8px for chips, 7.5px/circular for count badges).

---

## Release & Versioning Policy

1. **Frozen Releases**:
   - Never overwrite or modify existing release assets (e.g. `v1.3.0` is released and frozen).
   - Any new changes must be recorded for the next release (e.g. `1.3.1` or `1.4.0`) in `theme.yaml` files and under `## [Unreleased]` in `CHANGELOG.md`.
2. **Packaging**:
   - Package releases using `source/pack.ps1` via Playnite's `Toolbox.exe pack`.
   - Resulting `.pthm` bundles must match the version in `theme.yaml`.
3. **Live Syncing**:
   - Synchronize modified `.xaml` files directly to `%APPDATA%\Playnite\Themes\Desktop\Penumbra_Dawn_Theme` and `Penumbra_Night_Theme` so Torsten can test changes immediately.

---

## Documentation & Changelog

- **Language Rule**: `CHANGELOG.md` **MUST ALWAYS BE WRITTEN IN ENGLISH**! Never write changelog entries in German or any other language.
- Document every change under `[Unreleased]` using Keep a Changelog categories (`Added`, `Changed`, `Fixed`, `Removed`).
