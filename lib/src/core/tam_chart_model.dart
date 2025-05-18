import 'dart:ui';

import 'package:tam_chart/src/core/som_position_enums.dart';

/// A model class that holds the data for the TAM chart.
///
/// The [TAMChartData] class contains the values and styling information
/// needed to render a TAM (Total Addressable Market) chart.
class TAMChartData {
  /// The value representing the Total Addressable Market (TAM).
  ///
  /// Numeric values will be formatted into more readable strings:
  /// - `750` → `"750"`
  /// - `1500` → `"1.5K"`
  /// - `1500000` → `"1.5M"`
  /// - `1500000000` → `"1.5B"`
  final double tam;

  /// The value representing the Serviceable Available Market (SAM).
  ///
  /// Numeric values will be formatted into more readable strings:
  /// - `750` → `"750"`
  /// - `1500` → `"1.5K"`
  /// - `1500000` → `"1.5M"`
  /// - `1500000000` → `"1.5B"`
  final double sam;

  /// The value representing the Serviceable Obtainable Market (SOM).
  ///
  /// Numeric values will be formatted into more readable strings:
  /// - `750` → `"750"`
  /// - `1500` → `"1.5K"`
  /// - `1500000` → `"1.5M"`
  /// - `1500000000` → `"1.5B"`
  final double som;

  /// The duration of the animation in seconds.
  final int duration;

  /// The color of the TAM circle.
  final Color tamColor;

  /// The color of the SAM circle.
  final Color samColor;

  /// The color of the SOM circle.
  final Color somColor;

  /// The text color for the TAM value.
  final Color tamTextColor;

  /// The text color for the SAM value.
  final Color samTextColor;

  /// The text color for the SOM value.
  final Color somTextColor;

  /// The position of the SOM circle within the TAM chart.
  final SomPositions somPosition;

  /// The [duration], [tamTextColor], [samTextColor], [somTextColor], [tam],
  /// [sam], [som], [tamColor], [samColor], [somColor], and [somPosition]
  /// parameters must not be null.
  TAMChartData({
    required this.duration,
    required this.tamTextColor,
    required this.samTextColor,
    required this.somTextColor,
    required this.tam,
    required this.sam,
    required this.som,
    required this.tamColor,
    required this.samColor,
    required this.somColor,
    required this.somPosition,
  });
}
