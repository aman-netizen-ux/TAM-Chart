import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tam_chart/src/tam_chart_model.dart';
import 'package:tam_chart/src/tam_chart_painter.dart';

/// A widget that displays a Total Addressable Market (TAM) chart.
///
/// The [TAMChart] widget takes in [TAMChartData], font size, and size to render
/// a TAM chart with animation for each circle representing different market segments.
class TAMChart extends StatefulWidget {
  /// The data to be displayed in the TAM chart with its styling properties.
  /// 
  /// Example usage:
  /// ```dart
  /// TAMChart(
  ///   tamChartData: TAMChartData(
  ///     duration: 16,
  ///     tamTextColor: Colors.black,
  ///     samTextColor: Colors.white,
  ///     somTextColor: Colors.black,
  ///     tam: 300,
  ///     sam: 1500,
  ///     som: 750,
  ///     tamColor: Colors.blue.shade100,
  ///     samColor: Colors.blue.shade300,
  ///     somColor: Colors.blue,
  ///     somPosition: SomPositions.top,
  ///   ),
  ///   fontSize: 10,
  ///   size: const Size(200, 200),
  /// )
  /// ```
  final TAMChartData tamChartData;

  /// The font size for the labels in the TAM chart.
  final double fontSize;

  /// The size of the TAM chart.
  final Size size;

  /// Creates a TAMChart widget.
  ///
  /// The [tamChartData], [fontSize], and [size] parameters must not be null.
  const TAMChart(
      {super.key,
      required this.tamChartData,
      required this.fontSize,
      required this.size});

  @override
  State<TAMChart> createState() => _TAMChartState();
}

class _TAMChartState extends State<TAMChart> with TickerProviderStateMixin {
  late AnimationController _tmcontroller;
  late AnimationController _samController;
  late AnimationController _tamController;
  late Animation<double> _tmAnimation;
  late Animation<double> _samAnimation;
  late Animation<double> _tamAnimation;

  AnimationController _initializeAnimationController(int durationInSeconds) {
    return AnimationController(
      duration: Duration(seconds: durationInSeconds),
      vsync: this,
    );
  }

  Animation<double> _initializeTweenAnimation(
      AnimationController controller, double? forwardFrom) {
    Animation<double> animation =
        Tween<double>(begin: 0, end: 2 * pi).animate(controller)
          ..addListener(() {
            setState(() {});
          });
    controller.forward(from: forwardFrom);
    return animation;
  }

  @override
  void initState() {
    super.initState();

    ///For Outer Circle
    _tmcontroller =
        _initializeAnimationController(widget.tamChartData.duration);
    _tmAnimation = _initializeTweenAnimation(
        _tmcontroller, (0.17 * widget.tamChartData.duration) / 100);

    //For Middle Circle
    _samController = _initializeAnimationController(
        widget.tamChartData.duration * 75 ~/ 100);
    _samAnimation = _initializeTweenAnimation(
        _samController, (0.08 * widget.tamChartData.duration) / 100);

    //For Inner Circle
    _tamController = _initializeAnimationController(
        widget.tamChartData.duration * 50 ~/ 100);
    _tamAnimation = _initializeTweenAnimation(_samController, null);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: widget.size,
        painter: TAMChartPainter(
            somAngle: _tmAnimation.value,
            samAngle: _samAnimation.value,
            tamAngle: _tamAnimation.value,
            fontSize: widget.fontSize,
            tamChartData: widget.tamChartData),
      ),
    );
  }

  @override
  void dispose() {
    _tmcontroller.dispose();
    _samController.dispose();
    _tamController.dispose();
    super.dispose();
  }
}
