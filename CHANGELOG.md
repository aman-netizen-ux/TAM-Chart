# Changelog

All notable changes to this project will be documented in this file.

## [1.1.0] - 2025-05-19

### Added
- ✨ **Export Feature**:
  - Introduced `TAMChartExport` utility class.
  - Enables capturing the TAM Chart as a PNG image using `RepaintBoundary`.
  - Supports saving images on mobile/desktop (file system) and downloading on web via blob URLs.
  - Integrated into the example app with a floating export button for one-tap download.

### Updated
- 🔄 **Directional Circle Animation Logic**:
  - The chart's drawing animation now aligns with the specified `somPosition`.
  - Instead of always starting from the top, the circle now begins and ends its animation from the appropriate edge.
    - Example: If `somPosition` is set to `top`, the circle starts drawing from the top. If it's `left`, the animation begins from the left, and so on.
  - This makes the animation behavior more intuitive and consistent with the chart’s layout configuration.
- 💫 Enhanced the smoothness and precision of circular animations for a more fluid visual experience.

## [1.0.0] - 2024-07-13
### Added
- Added a comprehensive README file to provide detailed information about the project.
- Updated animation features for smoother transitions and enhanced visual appeal.

## [0.0.1] - 2024-07-11
### Added
- Initial release of the tam chart package.
- Size Customization: Allows users to customize the size of the chart to fit different screen sizes and layouts.
- Color Customization: Provides options to change the color scheme of the chart, enabling users to match their application's theme.
- Text Color Customization: Enables users to customize the text color within the chart, improving readability and design consistency.
- Animation Support: Includes smooth animation features for chart transitions and updates, enhancing visual appeal and user experience.