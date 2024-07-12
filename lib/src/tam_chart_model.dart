import 'dart:ui';

import 'package:tam_chart/src/tam_position_enums.dart';

class TAMChartData {
  final double tam;
  final double sam;
  final double tm;
  final int duration;
  final Color tamColor;
  final Color samColor;
  final Color tmColor;
  final Color tamTextColor;
  final Color samTextColor;
  final Color tmTextColor;
  final TamPositions tamPosition;

  TAMChartData({
    required this.duration,
    required this.tamTextColor,
    required this.samTextColor,
    required this.tmTextColor,
    required this.tam,
    required this.sam,
    required this.tm,
    required this.tamColor,
    required this.samColor,
    required this.tmColor,
    required this.tamPosition,
  });
}
