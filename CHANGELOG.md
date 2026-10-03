# Changelog

All notable changes to the Penumbra Themes suite (**Penumbra Dawn**, **Penumbra Night**, and **Penumbra Blur**) for Playnite will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- **Library Banners**: Added dedicated 600×100 Roberts Space Industries (RSI) library banner (`d2146b15-4cfc-40cc-93dd-1297e2e0aa49.png`) to `Images/Banners/PluginId/` in both Dawn and Night themes.
- **Packaging Automation**: Enhanced `source/pack.ps1` to automatically locate `Toolbox.exe` in `%LOCALAPPDATA%\Playnite` and package all three themes into ready-to-install `.pthm` bundles.

### Changed
- **Scroll Performance**: Enabled `VirtualizingPanel.ScrollUnit="Pixel"` on `PART_ListGames` in:
  - `PenumbraDawn/Views/LibraryGridView.xaml`
  - `PenumbraDawn/Views/LibraryDetailsView.xaml`
  - `PenumbraNight/Views/LibraryGridView.xaml`
  - `PenumbraNight/Views/LibraryDetailsView.xaml`  
  Eliminates micro-stutters and drastically improves list and grid scrolling smoothness.

### Fixed
- **Penumbra Dawn**: Corrected legacy theme name string `DH_Dawn` in `TopPanel.xaml` to `Penumbra Dawn`.

---

## [1.2.0] - 2026-05-30

### Added (Penumbra Night)
- **BackgroundChanger**: Plugin support for animated backgrounds and dynamic game cover transitions.
- **GameActivity**: Quick-access button and status indicators integrated into game details.
- **CheckDLC**: DLC inspection button integration.
- **ScreenshotsVisualizer**: Screenshots tab and embedded screenshot preview gallery.
- **ReviewViewer**: Game reviews tab integration directly within the details view.

---

## [1.1.0] - 2026-05-30

### Added (Dawn, Night, Blur)
- **Library Banners**: Support for `themeExtras.yaml` library banners across Dawn and Night themes with 124+ included banners.
- **Age Ratings**: Embedded visual badges for ESRB, PEGI, RARS, and CERO in Details and Grid views.
- **Platform Badges**: Added platform graphics (Commodore Amiga, NEC PC-9801, PICO-8, and more).
- **Video Controls**: Custom Play, Pause, and Mute media controls for trailer playback in Penumbra Night.
- **ThemeModifier**: Added `thememodifier.yaml` definitions for Penumbra Blur.

### Fixed
- Fixed theme identifier in `PenumbraDawn/themeExtras.yaml` to match `Penumbra_Dawn_Theme`.

---

## [1.0.0] - 2026-05-29

### Rebrand
- Initial release under the **Penumbra** suite banner (`Penumbra Dawn`, `Penumbra Night`, `Penumbra Blur`), succeeding the legacy `DH_Themes`.
- Migrated to Playnite Theme API Version 2.9.0.
