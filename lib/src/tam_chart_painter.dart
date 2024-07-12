import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tam_chart/src/tam_chart_model.dart';
import 'package:tam_chart/src/som_position_enums.dart';

/// A custom painter class that renders a Total Addressable Market (TAM) chart.
///
/// The [TAMChartPainter] class uses the provided [TAMChartData] to draw the TAM,
/// SAM, and SOM circles with animated segments and labels.
class TAMChartPainter extends CustomPainter {
  /// The angle of the SOM circle's animation.
  final double somAngle;

  /// The angle of the SAM circle's animation.
  final double samAngle;

  /// The angle of the TAM circle's animation.
  final double tamAngle;

  /// The data to be displayed in the TAM chart.
  final TAMChartData? tamChartData;

  /// The font size for the labels in the TAM chart.
  final double fontSize;

  /// Creates a [TAMChartPainter] instance.
  ///
  /// The [somAngle], [samAngle], [tamAngle], [tamChartData], and [fontSize]
  /// parameters must not be null.

  TAMChartPainter(
      {required this.fontSize,
      required this.tamChartData,
      required this.somAngle,
      required this.samAngle,
      required this.tamAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    //Bottom TAM CHART
    if (tamChartData!.somPosition == SomPositions.bottom) {
      // Calculating the radius for each circle based on the values
      double maxRadius =
          size.height / 4; // Assuming width and height of canvas are the same
      double tamRadius = maxRadius * (199 / 100);
      double samRadius = maxRadius * (137 / 100) + 2;
      double somRadius = maxRadius * (100 / 100);

      _createAnimatedCircle(
          paint, canvas, tamChartData!.tamColor, tamAngle, size, tamRadius);

      _createAnimatedCircle(
          paint, canvas, tamChartData!.samColor, samAngle, size, samRadius);

      _createAnimatedCircle(
          paint, canvas, tamChartData!.somColor, somAngle, size, somRadius);

      //Drawing text for SOM
      final textSpan = TextSpan(
          text: _convertDataValues(tamChartData!.som).toString(),
          style:
              TextStyle(color: tamChartData!.somTextColor, fontSize: fontSize));

      final textPainter =
          TextPainter(text: textSpan, textDirection: TextDirection.ltr);

      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(
          canvas,
          Offset(
              size.width / 2 - textPainter.width / 2, size.height - somRadius));

      //Drawing text for SAM
      final samTextSpan = TextSpan(
          text: _convertDataValues(tamChartData!.sam).toString(),
          style: TextStyle(
              color: tamChartData!.samTextColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold));

      final samTextPainter =
          TextPainter(text: samTextSpan, textDirection: TextDirection.ltr);

      samTextPainter.layout(minWidth: 0, maxWidth: size.width);
      samTextPainter.paint(
          canvas,
          Offset(
              size.width / 2 - samTextPainter.width / 2,
              (size.height - 2 * somRadius) -
                  ((2 * samRadius - 2 * somRadius) / 2) -
                  samTextPainter.height / 2.35));

      //Drawing text for tam
      final tamTextSpan = TextSpan(
          text: _convertDataValues(tamChartData!.tam).toString(),
          style:
              TextStyle(color: tamChartData!.tamTextColor, fontSize: fontSize));

      final tamTextPainter =
          TextPainter(text: tamTextSpan, textDirection: TextDirection.ltr);

      tamTextPainter.layout(minWidth: 0, maxWidth: size.width);
      tamTextPainter.paint(
          canvas,
          Offset(
              size.width / 2 - tamTextPainter.width / 2,
              (size.height - 2 * samRadius) -
                  ((2 * tamRadius - 2 * samRadius) / 2) -
                  tamTextPainter.height / 5.22));
    }

    //TOP TAM CHART

    if (tamChartData!.somPosition == SomPositions.top) {
      // Calculating the radius for each circle based on the values
      double maxRadius =
          size.height / 4; // Assuming width and height of canvas are the same
      double tamRadius = maxRadius * (199 / 100);
      double samRadius = maxRadius * (137 / 100) + 2;
      double somRadius = maxRadius * (100 / 100);

      _createAnimatedCircle(
          paint, canvas, tamChartData!.tamColor, tamAngle, size, tamRadius,
          offset: Offset(size.width / 2, size.height / 2));

      _createAnimatedCircle(
          paint, canvas, tamChartData!.samColor, samAngle, size, samRadius,
          offset: Offset(size.width / 2, samRadius));

      _createAnimatedCircle(
          paint, canvas, tamChartData!.somColor, somAngle, size, somRadius,
          offset: Offset(size.width / 2, somRadius));

      //Drawing text for SOM
      final textSpan = TextSpan(
          text: _convertDataValues(tamChartData!.som),
          style:
              TextStyle(color: tamChartData!.somTextColor, fontSize: fontSize));

      final textPainter =
          TextPainter(text: textSpan, textDirection: TextDirection.ltr);

      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(
          canvas, Offset(size.width / 2 - textPainter.width / 2, somRadius));

      //Drawing text for SAM
      final samTextSpan = TextSpan(
          text: _convertDataValues(tamChartData!.sam),
          style:
              TextStyle(color: tamChartData!.samTextColor, fontSize: fontSize));

      final samTextPainter =
          TextPainter(text: samTextSpan, textDirection: TextDirection.ltr);

      samTextPainter.layout(minWidth: 0, maxWidth: size.width);
      samTextPainter.paint(
          canvas,
          Offset(
              size.width / 2 - samTextPainter.width / 2,
              (2 * somRadius) +
                  ((2 * samRadius - 2 * somRadius) / 2) -
                  samTextPainter.height / 2.35));

      //Drawing text for tam
      final tamTextSpan = TextSpan(
          text: _convertDataValues(tamChartData!.tam),
          style:
              TextStyle(color: tamChartData!.tamTextColor, fontSize: fontSize));

      final tamTextPainter =
          TextPainter(text: tamTextSpan, textDirection: TextDirection.ltr);

      tamTextPainter.layout(minWidth: 0, maxWidth: size.width);
      tamTextPainter.paint(
          canvas,
          Offset(
              size.width / 2 - tamTextPainter.width / 2,
              (2 * samRadius) +
                  ((2 * tamRadius - 2 * samRadius) / 2) -
                  tamTextPainter.height / 2));
    }

    //LEFT TAM CHART

    if (tamChartData!.somPosition == SomPositions.left) {
      // Calculating the radius for each circle based on the values
      double maxRadius =
          size.height / 4; // Assuming width and height of canvas are the same
      double tamRadius = maxRadius * (199 / 100);
      double samRadius = maxRadius * (137 / 100) + 7;
      double somRadius = maxRadius * (100 / 100) - 3;

      _createAnimatedCircle(
          paint, canvas, tamChartData!.tamColor, tamAngle, size, tamRadius,
          offset: Offset(size.width / 2, size.height / 2));

      _createAnimatedCircle(
          paint, canvas, tamChartData!.samColor, samAngle, size, samRadius,
          offset: Offset(
              (size.width - size.height) / 2 + samRadius, size.height / 2));

      _createAnimatedCircle(
          paint, canvas, tamChartData!.somColor, somAngle, size, somRadius,
          offset: Offset(
              (size.width - size.height) / 2 + somRadius, size.height / 2));

      //Drawing text for SOM
      final textSpan = TextSpan(
          text: _convertDataValues(tamChartData!.som),
          style:
              TextStyle(color: tamChartData!.somTextColor, fontSize: fontSize));

      final textPainter =
          TextPainter(text: textSpan, textDirection: TextDirection.ltr);

      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(
          canvas,
          Offset(
              (size.width - size.height) / 2 +
                  somRadius -
                  textPainter.width / 2,
              size.height / 2 - textPainter.height / 2));

      //Drawing text for SAM
      final samTextSpan = TextSpan(
          text: _convertDataValues(tamChartData!.sam),
          style:
              TextStyle(color: tamChartData!.samTextColor, fontSize: fontSize));

      final samTextPainter =
          TextPainter(text: samTextSpan, textDirection: TextDirection.ltr);

      samTextPainter.layout(minWidth: 0, maxWidth: size.width);
      samTextPainter.paint(
          canvas,
          Offset(
              (size.width - size.height) / 2 +
                  (2 * somRadius) +
                  ((2 * samRadius - 2 * somRadius) / 2) -
                  samTextPainter.width / 1.75,
              size.height / 2 - samTextPainter.height / 2));

      //Drawing text for tam
      final tamTextSpan = TextSpan(
          text: _convertDataValues(tamChartData!.tam),
          style:
              TextStyle(color: tamChartData!.tamTextColor, fontSize: fontSize));

      final tamTextPainter =
          TextPainter(text: tamTextSpan, textDirection: TextDirection.ltr);

      tamTextPainter.layout(minWidth: 0, maxWidth: size.width);
      tamTextPainter.paint(
          canvas,
          Offset(
              (size.width - size.height) / 2 +
                  (2 * samRadius) +
                  ((2 * tamRadius - 2 * samRadius) / 2) -
                  tamTextPainter.width / 1.75,
              size.height / 2 - tamTextPainter.height / 2));
    }

    //RIGHT TAM CHART
    if (tamChartData!.somPosition == SomPositions.right) {
      // Calculating the radius for each circle based on the values
      double maxRadius =
          size.height / 4; // Assuming width and height of canvas are the same
      double tamRadius = maxRadius * (199 / 100);
      double samRadius = maxRadius * (137 / 100) + 7;
      double somRadius = maxRadius * (100 / 100) - 3;

      _createAnimatedCircle(
          paint, canvas, tamChartData!.tamColor, tamAngle, size, tamRadius,
          offset: Offset(size.width / 2, size.height / 2));

      _createAnimatedCircle(
          paint, canvas, tamChartData!.samColor, samAngle, size, samRadius,
          offset: Offset((size.width - size.height) / 2 + (size.height - samRadius),
              size.height / 2),);

      _createAnimatedCircle(
          paint, canvas, tamChartData!.somColor, somAngle, size, somRadius,
          offset: Offset((size.width - size.height) / 2 + (size.height - somRadius),
              size.height / 2));

      

     

     

      //Drawing text for SOM
      final textSpan = TextSpan(
          text: _convertDataValues(tamChartData!.som),
          style:
              TextStyle(color: tamChartData!.somTextColor, fontSize: fontSize));

      final textPainter =
          TextPainter(text: textSpan, textDirection: TextDirection.ltr);

      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(
          canvas,
          Offset(
              (size.width - size.height) / 2 +
                  (size.height - somRadius - textPainter.width / 2),
              size.height / 2 - textPainter.height / 2));

      //Drawing text for SAM
      final samTextSpan = TextSpan(
          text: _convertDataValues(tamChartData!.sam),
          style:
              TextStyle(color: tamChartData!.samTextColor, fontSize: fontSize));

      final samTextPainter =
          TextPainter(text: samTextSpan, textDirection: TextDirection.ltr);

      samTextPainter.layout(minWidth: 0, maxWidth: size.width);
      samTextPainter.paint(
          canvas,
          Offset(
              (size.width - size.height) / 2 +
                  (size.height - 2 * somRadius) -
                  ((2 * samRadius - 2 * somRadius) / 2) -
                  samTextPainter.width / 2,
              size.height / 2 - samTextPainter.height / 2));

      //Drawing text for tam
      final tamTextSpan = TextSpan(
          text: _convertDataValues(tamChartData!.tam),
          style:
              TextStyle(color: tamChartData!.tamTextColor, fontSize: fontSize));

      final tamTextPainter =
          TextPainter(text: tamTextSpan, textDirection: TextDirection.ltr);

      tamTextPainter.layout(minWidth: 0, maxWidth: size.width);
      tamTextPainter.paint(
          canvas,
          Offset(
              (size.width - size.height) / 2 +
                  (size.height - 2 * samRadius) -
                  ((2 * tamRadius - 2 * samRadius) / 2) -
                  tamTextPainter.width / 2,
              size.height / 2 - tamTextPainter.height / 2));
    }

    //Center TAM CHART
    if (tamChartData!.somPosition == SomPositions.center) {
      // Calculating the radius for each circle based on the values
      double maxRadius =
          size.height / 4; // Assuming width and height of canvas are the same
      double tamRadius = maxRadius * (199 / 100);
      double samRadius = maxRadius * (137 / 100);
      double somRadius = maxRadius * (100 / 100) - 10;


      //Drawing TAM circle(Outer Circle)
      _createAnimatedCircle(
          paint, canvas, tamChartData!.tamColor, tamAngle, size, tamRadius,
          offset: Offset(size.width / 2, size.height / 2));
        
        // Drawing SAM circle
      _createAnimatedCircle(
          paint, canvas, tamChartData!.samColor, samAngle, size, samRadius,
          offset: Offset((size.width / 2), size.height / 2));

      // Drawing SOM circle(Inner circle)
      _createAnimatedCircle(
          paint, canvas, tamChartData!.somColor, somAngle, size, somRadius,
          offset:  Offset(size.width / 2, size.height / 2));


      

     

      

      //Drawing text for SOM(Inner Text)
      final textSpan = TextSpan(
          text: _convertDataValues(tamChartData!.som),
          style:
              TextStyle(color: tamChartData!.somTextColor, fontSize: fontSize));

      final textPainter =
          TextPainter(text: textSpan, textDirection: TextDirection.ltr);

      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(
          canvas,
          Offset(size.width / 2 - textPainter.width / 2,
              size.height / 2 - textPainter.height / 2));

      //Drawing text for SAM
      final samTextSpan = TextSpan(
          text: _convertDataValues(tamChartData!.sam).toString(),
          style:
              TextStyle(color: tamChartData!.samTextColor, fontSize: fontSize));

      final samTextPainter =
          TextPainter(text: samTextSpan, textDirection: TextDirection.ltr);

      samTextPainter.layout(minWidth: 0, maxWidth: size.width);
      samTextPainter.paint(
          canvas,
          Offset(
              size.width / 2 - samTextPainter.width / 2,
              (size.height / 2 - somRadius) -
                  ((samRadius - somRadius) / 2) -
                  samTextPainter.height / 4));

      //Drawing text for tam(Outer Text)
      final tamTextSpan = TextSpan(
          text: _convertDataValues(tamChartData!.tam).toString(),
          style:
              TextStyle(color: tamChartData!.tamTextColor, fontSize: fontSize));

      final tamTextPainter =
          TextPainter(text: tamTextSpan, textDirection: TextDirection.ltr);

      tamTextPainter.layout(minWidth: 0, maxWidth: size.width);
      tamTextPainter.paint(
          canvas,
          Offset(
              size.width / 2 - tamTextPainter.width / 2,
              (size.height / 2 - samRadius) -
                  ((tamRadius - samRadius) / 2) -
                  tamTextPainter.height / 4));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

_convertDataValues(double data) {
  if (data < 1000) {
    return data.toString();
  } else if (data >= 1000 && data < 1000000) {
    data = double.parse((data / 1000).toStringAsFixed(2));
    return '${data.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "")}K';
  } else if (data >= 1000000 && data < 1000000000) {
    data = double.parse((data / 1000000).toStringAsFixed(2));
    return '${data.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "")}M';
  } else {
    data = double.parse((data / 1000000000).toStringAsFixed(2));
    return '${data.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "")}B';
  }
}

_createAnimatedCircle(Paint paint, Canvas canvas, Color color, double angle,
    Size size, double radius,
    {Offset? offset}) {
  paint.color = color;
  const int segmentCount = 4;
  final int currentSegment = (angle * segmentCount).floor();
  const double sweep = 2 * pi / segmentCount;
  const double startAngle = -pi / 2; // Start at the top of the circle

  for (int i = 0; i <= currentSegment; i++) {
    // For the current segment, use the animation progress to determine the sweep angle
    double currentSweep = sweep;
    if (i == currentSegment) {
      currentSweep *= (angle * segmentCount) % 1;
    }
    // Calculate the start angle for the segment
    double segmentStartAngle = startAngle + (sweep * i);
    // Draw the segment
    canvas.drawArc(
      Rect.fromCenter(
          center: offset ?? Offset(size.width / 2, size.height - radius),
          width: 2 * radius,
          height: 2 * radius),
      segmentStartAngle,
      currentSweep,
      true,
      paint,
    );
  }
}
