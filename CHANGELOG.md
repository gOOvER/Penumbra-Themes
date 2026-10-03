# Changelog

All notable changes to the Penumbra Themes suite (**Penumbra Dawn**, **Penumbra Night**, and **Penumbra Blur**) for Playnite will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.3.0] - 2026-10-03

### Added
- **ImageRotater**: Fast-path theme rendering controls (`ImageRotater_Cover` and `ImageRotater_Background`) in Grid, Details, and Fullscreen (Penumbra Blur) views with seamless fallback to `BackgroundChanger` and native media.
- **PlayniteAchievements**: Native controls (`PlayniteAchievements_AchievementButton`, `PlayniteAchievements_AchievementCompactList`, `PlayniteAchievements_AchievementBarChart`, `PlayniteAchievements_AchievementDataGrid`) configured as default provider with animated progress bar and floating quick-launch button; SuccessStory is only used as a fallback when PlayniteAchievements is not installed.
- **GameActivity**: Deep integration in dedicated "Activity" tab hosting playtime timeline curve (`GameActivity_PluginChartTime`) positioned directly above session logs (`GameActivity_PluginChartLog`), keeping descriptions clean.
- **CheckDLC**: Dedicated "DLC" tab hosting `CheckDlc_PluginListDlcAll` with ownership indicators.
- **CheckLocalizations**: Integrated `CheckLocalizations_PluginButton`, supported language flag icons (`CheckLocalizations_PluginFlags`) in metadata panels, and full language support matrix tab `CheckLocalizations_CheckLocListLanguages`.
- **SystemChecker**: Action bar quick-launch button `SystemChecker_PluginButton` and system requirement metadata status in Dawn and Night themes.
- **ThemeModifier**: Integrated `ThemeModifier_PluginIcon` for custom icon shapes (squircles, circles, hexes) in game overview and expanded `thememodifier.yaml` customization options across Night and Blur.
- **DescriptionEngine**: Upgraded `DescriptionView.html` with responsive CSS styles for tables, blockquotes, callouts, spoilers, code blocks, and rounded images (optimized for DescriptionEditor).
- **Library Banners**: Added dedicated 600×100 Roberts Space Industries (RSI) library banner (`d2146b15-4cfc-40cc-93dd-1297e2e0aa49.png`) to `Images/Banners/PluginId/` in both Dawn and Night themes.
- **Packaging Automation**: Enhanced `source/pack.ps1` to automatically locate `Toolbox.exe` in `%LOCALAPPDATA%\Playnite` and package all three themes into ready-to-install `.pthm` bundles.

### Changed
- **Scroll & Virtualization Performance**: Upgraded `PART_ListGames` across `LibraryGridView.xaml` and `LibraryDetailsView.xaml` (in both Penumbra Dawn and Penumbra Night) to use the full WPF virtualization and smooth scrolling stack:
  - `VirtualizingPanel.ScrollUnit="Pixel"` for smooth, pixel-precise scrolling without jumping between items.
  - `VirtualizingPanel.VirtualizationMode="Recycling"` to reuse item visual tree containers instead of destroying and reallocating them on every scroll, eliminating garbage collection pauses.
  - `VirtualizingPanel.IsVirtualizingWhenGrouping="True"` ensuring virtualization remains active when grouping games by platform, genre, or category.
  - `VirtualizingPanel.CacheLength="1,2"` and `VirtualizingPanel.CacheLengthUnit="Page"` for predictive view buffer caching to prevent pop-in stutters during rapid scrolling.
  - `ScrollViewer.CanContentScroll="True"` to maintain virtualization delegation across the scroll viewer.

### Fixed
- **WindowChrome & Dialog Layout**: Fixed horizontal and vertical clipping on modal dialogs and plugin popup windows (e.g. `PlayniteAchievements` Single Game Achievements matrix) by aligning `StandardWindowStyle` and `MainWindowStyle` with Playnite's standard `WindowChrome` parameters (`GlassFrameThickness="0"`, `CornerRadius="0"`) and removing disruptive `WindowStyle="SingleBorderWindow"` which caused DWM frame encroachment on boundaries.
- **XAML Parser Compatibility**: Resolved startup `XamlParseException` errors by removing unsupported `FallbackValue` attributes from `DynamicResourceExtension` on achievement localization bindings, and correcting corrupted XML tags in `DetailsViewGameOverview.xaml`.
- **Packaging Script**: Fixed `pack.ps1` working directory handling when invoking `Toolbox.exe` so theme `.pthm` bundles compile reliably across environments.
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
