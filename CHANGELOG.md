# Changelog

All notable changes to the Penumbra Themes suite (**Penumbra Dawn**, **Penumbra Night**, and **Penumbra Blur**) for Playnite will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.4.0] - 2026-10-03

### Added
- **ScreenshotsVisualizer Dual-Support & Card Container**:
  - Implemented dual-mode support for both horizontal gallery (`ScreenshotsVisualizer_PluginScreenshots`) and vertical list (`ScreenshotsVisualizer_PluginListScreenshotsVertical`) in the "Screenshots" expander tab across Penumbra Dawn and Penumbra Night, automatically toggling based on user plugin configuration (`EnableIntegrationShowPictures`).
  - Enclosed the screenshots presentation within a dark frosted-glass container card (`#70101016` background, `PanelSeparatorBrush` border, and rounded 8px corners) matching the DLC, Languages, and Reviews tabs.
- **Penumbra Blur Fullscreen Status Badges & Controller Navigation**:
  - Embedded compact status badges for HowLongToBeat (`HowLongToBeat_PluginProgressBar`) and Achievements (`PlayniteAchievements_AchievementProgressBar` with fallback to `SuccessStory_PluginProgressBar`) into the metadata header row in Penumbra Blur fullscreen mode.
  - Injected controller-navigable focusable buttons (`PlayniteAchievements_AchievementButton`, `SuccessStory_PluginButton`) into the action bar (`ButtonPanel`), allowing smooth D-pad controller navigation alongside Play, Options, and Context actions.
  - Standardized rounded 8px corner radius (`ControlCornerRadius`) for fullscreen buttons and focus highlight rings.
- **DuplicateHider & Source-Badge Polish**:
  - Streamlined source-badge margins, padding, and alignment across Grid, Details, and Fullscreen views (`Margin="5"`, `RenderOptions.BitmapScalingMode="Fant"`).
  - Added frosted pill background (`CornerRadius="8"`) to source selector containers in Grid and List views for crisp legibility over bright game covers.
  - Added platform name fallback trigger in Penumbra Night for emulated games where the source is "Playnite" so the platform badge displays cleanly.
  - Added max icon limit resource keys (`DuplicateHider_MaxNumberOfIcons`, `DuplicateHider_MaxNumberOfIcons1`, `DuplicateHider_MaxNumberOfIcons2`) in Penumbra Dawn to prevent badge overflow on game covers.
  - Made DuplicateHider launch buttons in Penumbra Blur fullscreen mode rounded and focusable via controller.
- **Horizontal Chip Badges (`ChipPropertyItemButton`)**: Replaced the vertical list layout for game metadata (Features, Tags, Categories, Genres, Platforms, Series, Regions) with modern horizontal wrap chips:
  - Multi-item properties now render using `WrapPanel`, allowing items to flow horizontally side-by-side rather than stacking vertically, reducing vertical height by up to 70%.
  - Semi-translucent badge container with rounded 4px corners, subtle border, and responsive hover/pressed states.
  - Safe truncation (`CharacterEllipsis`) and tooltip inspection on long tag names to prevent column overflow.

### Changed
- **Details Sidebar Layout & Presentation Card**:
  - Enclosed the entire Details sidebar within a dark frosted-glass container card (`#70101016` background with `PanelSeparatorBrush` border and rounded 8px corners) across Penumbra Dawn and Penumbra Night, eliminating text clashing and bleed-through from bright or complex game background wallpapers (such as weather charts or UI art).
  - Explicitly bound `x:Key="PropertyItemButton"` within all metadata `ItemsControl` resources, ensuring Playnite's internal button factories properly receive the `ChipPropertyItemButton` styling (with rounded borders, margins, padding, and hover states) rather than plain text.
  - Increased details column width to 330px for comfortable horizontal chip flow and balanced proportions against the tabbed description area.
  - Formatted `PART_ButtonInstallDirectory` to single-line with `TextTrimming="CharacterEllipsis"` and full path tooltip on hover, preventing file paths from breaking into multiple messy lines.
  - Increased content grid left margin in Penumbra Dawn from 20px to 70px, providing 20px of clean negative space after the 50px floating action toolbar (Play, Edit, Achievements, GameActivity, HLTB) and preventing the toolbar from overlapping the Details sidebar across all games.
  - Wrapped multi-developer and multi-publisher lists with horizontal `WrapPanel` and proper right margins for cleaner alignment.
- **ReviewViewer ("Bewertungen") Theme Integration**:
  - Enclosed the reviews tab (`ReviewViewer_ReviewsControl`) inside a dark frosted-glass container card (`#70101016` background, `PanelSeparatorBrush` border, and rounded 8px corners) across Penumbra Dawn and Penumbra Night, preventing reviews and author text from floating bare over background wallpapers.
  - Injected modern rounded button styles (`CornerRadius="{DynamicResource ControlCornerRadius}"`, subtle glass background, responsive hover scaling, and glyph highlights) for action buttons, pagination controls, and filter tags within the reviews interface.
  - Defined fallback tab-style resources (`CornerRadius="8,8,0,0"`, glass backgrounds, and accent underlines) ready for future upstream or dynamic extension theming.
- **Theme-Wide Rounded Corner Radius Consistency**:
  - Upgraded base `ControlCornerRadius` and `InputCornerRadius` from 5px to 8px in `Constants.xaml` for Penumbra Night, bringing smooth, modern rounded geometry to all Buttons, ToggleButtons, TextBoxes, ComboBoxes, and control borders across the entire theme.
  - Converted `TabItem` header containers (`TabGrid`) from sharp rectangular `Grid` to `Border` with `CornerRadius="8,8,0,0"` in both Penumbra Dawn and Penumbra Night (`TabControl.xaml`), ensuring active and hovered tabs render with sleek rounded top corners rather than square edges.
  - Added directional `CornerRadius` triggers (`8,0,0,8`, `0,8,8,0`, `0,0,8,8`) for left, right, and bottom tab strip placements.
  - Upgraded `ChipPropertyItemButton` badge corner radius from 4px to 8px in both Penumbra Dawn and Penumbra Night for sleek pill badges.
  - Rounded top bar filter toggles (`ControlCornerRadius`) and converted notification count badges to smooth circular pills (7.5px radius) across Dawn and Night.
  - Updated PlayButton extra options dropdown container and selection highlights to rounded 8px corners.
  - Updated `TextBox`, `FilterSelectionBox`, and `NumericBoxes` to dynamically bind to `ControlCornerRadius`.
- **CheckDlc Tab Single-Scroll & Text Clipping Fix**:
  - Replaced stacked triple-control setup (`MinHeight="720"` x 3) with a single, dedicated card container hosting `CheckDlc_PluginListDlcAll` constrained to `Height="480"` with rounded 8px corners across Penumbra Dawn and Penumbra Night.
  - Fixed duplicate double scrollbar defect by keeping the DLC tab within standard viewport height so only the DLC list scrolls internally while the outer page scrollbar remains deactivated.
  - Injected `Label` text trimming (`TextTrimming="CharacterEllipsis"`), rounded button styling (`CornerRadius="{DynamicResource ControlCornerRadius}"`), and `ScrollViewer.HorizontalScrollBarVisibility="Disabled"` into `CheckDlc_PluginListDlcAll.Resources` so long DLC titles never push the ownership status ("Im Besitz") and store link button off-screen into the vertical scrollbar.
- **CheckLocalizations Languages Tab Integration & Layout Polish**:
  - Corrected the `ContentControl` name in the "Languages" tab from `CheckLocalizations_CheckLocListLanguages` to `CheckLocalizations_PluginListLanguages` across Penumbra Dawn and Penumbra Night to match the control identifier registered by CheckLocalizations.dll, resolving the issue where the Languages tab rendered blank.
  - Set explicit `MinHeight="480"` alongside `Height="480"` on `CheckLocalizations_PluginListLanguages`, overriding the plugin's internal 140px height constraint and eliminating the empty black void beneath the table to display 12+ rows cleanly.
  - Enhanced `GridViewColumnHeader` styling in `ListView.xaml`: wrapped column header content with `Viewbox Stretch="Uniform" StretchDirection="DownOnly"` so long localized headers like German "Benutzeroberfläche" automatically scale down to fit within the 80px column width without clipping into "Benutzerol", and added full-title tooltip on hover.
  - Collapsed the empty filler header when `Role="Padding"` so the unused space to the right of columns no longer displays an awkward stretched pill border.
  - Upgraded `ListViewItem` row styling with rounded 8px selection and hover borders (`CornerRadius="{DynamicResource ControlCornerRadius}"`), comfortable 32px minimum height, and transparent baseline background.
  - Enclosed the language matrix within a dark frosted-glass container card (`#70101016` background, `PanelSeparatorBrush` border, and rounded 8px corners) with smooth internal scrolling.
- **Widescreen Content Width Expansion (`DetailsViewMaxContentWidth`)**:
  - Increased `DetailsViewMaxContentWidth` from the legacy 1024px constraint to 1600px in `Constants.xaml` across Penumbra Night and Penumbra Dawn, eliminating large empty/cutoff areas on widescreen displays (1080p, 1440p, 4K) and giving descriptions and plugin tabs generous horizontal space.

### Fixed
- **Empty Tab Gap & Header Clipping Between Description & Activity**:
  - Fixed an issue where the Achievements tab remained visible as an empty ghost tab for games without achievements (such as *Foundry*) due to a missing `BooleanToVisibilityConverter` on its `Visibility` binding in both Penumbra Dawn and Penumbra Night.
  - Bound the Notes tab in Penumbra Dawn to `Game.Notes` using `StringNullOrEmptyToVisibilityConverter`, ensuring it collapses completely when a game has no notes instead of showing an empty tab.
  - Eliminated the wide empty gap between "Beschreibung" and "Activity" tabs and prevented adjacent tab headers from being cramped or clipped.

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
