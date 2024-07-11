import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tam_chart/src/tam_chart_model.dart';
import 'package:tam_chart/src/tam_position_enums.dart';



class TAMChartPainter extends CustomPainter {
  final double tmAngle;
  final double samAngle;
  final double tamAngle;
  final TAMChartData? tamChartData;
  final double fontSize;

  TAMChartPainter(
      {required this.fontSize, required this.tamChartData, required this.tmAngle, required this.samAngle, required this.tamAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    //Bottom TAM CHART
    if (tamChartData!.tamPosition == TamPositions.bottom) {
      // Calculating the radius for each circle based on the values
      double maxRadius =
          size.height / 4; // Assuming width and height of canvas are the same
      double tamRadius = maxRadius * (199 / 100);
      double samRadius = maxRadius * (137 / 100) + 2;
      double tmRadius = maxRadius * (100 / 100);

      createAnimatedCircle(paint, canvas, tamChartData!.tamColor, tamAngle, size, tamRadius);

      createAnimatedCircle(paint, canvas, tamChartData!.samColor, samAngle, size, samRadius);

    createAnimatedCircle(paint, canvas, tamChartData!.tmColor, tmAngle, size, tmRadius);
     

      //Drawing text for TM
      final textSpan = TextSpan(
          text: convertDataValues(tamChartData!.tm).toString(),
          style:
              TextStyle(color: tamChartData!.tmTextColor, fontSize: fontSize));

      final textPainter =
          TextPainter(text: textSpan, textDirection: TextDirection.ltr);

      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(
          canvas,
          Offset(
              size.width / 2 - textPainter.width / 2, size.height - tmRadius));

      //Drawing text for SAM
      final samTextSpan = TextSpan(
          text: convertDataValues(tamChartData!.sam).toString(),
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
              (size.height - 2 * tmRadius) -
                  ((2 * samRadius - 2 * tmRadius) / 2) -
                  samTextPainter.height / 2.35));

      //Drawing text for tam
      final tamTextSpan = TextSpan(
          text: convertDataValues(tamChartData!.tam).toString(),
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

    if (tamChartData!.tamPosition == TamPositions.top) {
      // Calculating the radius for each circle based on the values
      double maxRadius =
          size.height / 4; // Assuming width and height of canvas are the same
      double tamRadius = maxRadius * (199 / 100);
      double samRadius = maxRadius * (137 / 100) + 2;
      double tmRadius = maxRadius * (100 / 100);

      //Drawing TAM circle
      paint.color = tamChartData!.tamColor;
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2), tamRadius, paint);

      // Drawing SAM circle
      paint.color = tamChartData!.samColor;
      canvas.drawCircle(Offset(size.width / 2, samRadius), samRadius, paint);

      // Drawing TM circle
      paint.color = tamChartData!.tmColor;
      canvas.drawCircle(Offset(size.width / 2, tmRadius), tmRadius, paint);

      //Drawing text for TM
      final textSpan = TextSpan(
          text: convertDataValues(tamChartData!.tm),
          style:
              TextStyle(color: tamChartData!.tmTextColor, fontSize: fontSize));

      final textPainter =
          TextPainter(text: textSpan, textDirection: TextDirection.ltr);

      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(
          canvas, Offset(size.width / 2 - textPainter.width / 2, tmRadius));

      //Drawing text for SAM
      final samTextSpan = TextSpan(
          text: convertDataValues(tamChartData!.sam),
          style:
              TextStyle(color: tamChartData!.samTextColor, fontSize: fontSize));

      final samTextPainter =
          TextPainter(text: samTextSpan, textDirection: TextDirection.ltr);

      samTextPainter.layout(minWidth: 0, maxWidth: size.width);
      samTextPainter.paint(
          canvas,
          Offset(
              size.width / 2 - samTextPainter.width / 2,
              (2 * tmRadius) +
                  ((2 * samRadius - 2 * tmRadius) / 2) -
                  samTextPainter.height / 2.35));

      //Drawing text for tam
      final tamTextSpan = TextSpan(
          text: convertDataValues(tamChartData!.tam),
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

    if (tamChartData!.tamPosition == TamPositions.left) {
      // Calculating the radius for each circle based on the values
      double maxRadius =
          size.height / 4; // Assuming width and height of canvas are the same
      double tamRadius = maxRadius * (199 / 100);
      double samRadius = maxRadius * (137 / 100) + 7;
      double tmRadius = maxRadius * (100 / 100) - 3;

      //Drawing TAM circle
      paint.color = tamChartData!.tamColor;
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2), tamRadius, paint);

      // Drawing SAM circle
      paint.color = tamChartData!.samColor;
      canvas.drawCircle(
          Offset((size.width - size.height) / 2 + samRadius, size.height / 2),
          samRadius,
          paint);

      // Drawing TM circle
      paint.color = tamChartData!.tmColor;
      canvas.drawCircle(
          Offset((size.width - size.height) / 2 + tmRadius, size.height / 2),
          tmRadius,
          paint);

      //Drawing text for TM
      final textSpan = TextSpan(
          text: convertDataValues(tamChartData!.tm),
          style:
              TextStyle(color: tamChartData!.tmTextColor, fontSize: fontSize));

      final textPainter =
          TextPainter(text: textSpan, textDirection: TextDirection.ltr);

      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(
          canvas,
          Offset(
              (size.width - size.height) / 2 + tmRadius - textPainter.width / 2,
              size.height / 2 - textPainter.height / 2));

      //Drawing text for SAM
      final samTextSpan = TextSpan(
          text: convertDataValues(tamChartData!.sam),
          style:
              TextStyle(color: tamChartData!.samTextColor, fontSize: fontSize));

      final samTextPainter =
          TextPainter(text: samTextSpan, textDirection: TextDirection.ltr);

      samTextPainter.layout(minWidth: 0, maxWidth: size.width);
      samTextPainter.paint(
          canvas,
          Offset(
              (size.width - size.height) / 2 +
                  (2 * tmRadius) +
                  ((2 * samRadius - 2 * tmRadius) / 2) -
                  samTextPainter.width / 1.75,
              size.height / 2 - samTextPainter.height / 2));

      //Drawing text for tam
      final tamTextSpan = TextSpan(
          text: convertDataValues(tamChartData!.tam),
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
    if (tamChartData!.tamPosition == TamPositions.right) {
      // Calculating the radius for each circle based on the values
      double maxRadius =
          size.height / 4; // Assuming width and height of canvas are the same
      double tamRadius = maxRadius * (199 / 100);
      double samRadius = maxRadius * (137 / 100) + 7;
      double tmRadius = maxRadius * (100 / 100) - 3;

      //Drawing TAM circle
      paint.color = tamChartData!.tamColor;
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2), tamRadius, paint);

      // Drawing SAM circle
      paint.color = tamChartData!.samColor;
      canvas.drawCircle(
          Offset((size.width - size.height) / 2 + (size.height - samRadius),
              size.height / 2),
          samRadius,
          paint);

      // Drawing TM circle
      paint.color = tamChartData!.tmColor;
      canvas.drawCircle(
          Offset((size.width - size.height) / 2 + (size.height - tmRadius),
              size.height / 2),
          tmRadius,
          paint);

      //Drawing text for TM
      final textSpan = TextSpan(
          text: convertDataValues(tamChartData!.tm),
          style:
              TextStyle(color: tamChartData!.tmTextColor, fontSize: fontSize));

      final textPainter =
          TextPainter(text: textSpan, textDirection: TextDirection.ltr);

      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(
          canvas,
          Offset(
              (size.width - size.height) / 2 +
                  (size.height - tmRadius - textPainter.width / 2),
              size.height / 2 - textPainter.height / 2));

      //Drawing text for SAM
      final samTextSpan = TextSpan(
          text: convertDataValues(tamChartData!.sam),
          style:
              TextStyle(color: tamChartData!.samTextColor, fontSize: fontSize));

      final samTextPainter =
          TextPainter(text: samTextSpan, textDirection: TextDirection.ltr);

      samTextPainter.layout(minWidth: 0, maxWidth: size.width);
      samTextPainter.paint(
          canvas,
          Offset(
              (size.width - size.height) / 2 +
                  (size.height - 2 * tmRadius) -
                  ((2 * samRadius - 2 * tmRadius) / 2) -
                  samTextPainter.width / 2,
              size.height / 2 - samTextPainter.height / 2));

      //Drawing text for tam
      final tamTextSpan = TextSpan(
          text: convertDataValues(tamChartData!.tam),
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
    if (tamChartData!.tamPosition == TamPositions.center) {
      // Calculating the radius for each circle based on the values
      double maxRadius =
          size.height / 4; // Assuming width and height of canvas are the same
      double tamRadius = maxRadius * (199 / 100);
      double samRadius = maxRadius * (137 / 100);
      double tmRadius = maxRadius * (100 / 100) - 10;

      //Drawing TAM circle(Outer Circle)
      paint.color = tamChartData!.tamColor;
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2), tamRadius, paint);

      // Drawing SAM circle
      paint.color = tamChartData!.samColor;
      canvas.drawCircle(
          Offset((size.width / 2), size.height / 2), samRadius, paint);

      // Drawing TM circle(Inner circle)
      paint.color = tamChartData!.tmColor;
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2), tmRadius, paint);

      //Drawing text for TM(Inner Text)
      final textSpan = TextSpan(
          text: convertDataValues(tamChartData!.tm),
          style:
              TextStyle(color: tamChartData!.tmTextColor, fontSize: fontSize));

      final textPainter =
          TextPainter(text: textSpan, textDirection: TextDirection.ltr);

      textPainter.layout(minWidth: 0, maxWidth: size.width);
      textPainter.paint(
          canvas,
          Offset(size.width / 2 - textPainter.width / 2,
              size.height / 2 - textPainter.height / 2));

      //Drawing text for SAM
      final samTextSpan = TextSpan(
          text: convertDataValues(tamChartData!.sam).toString(),
          style:
              TextStyle(color: tamChartData!.samTextColor, fontSize: fontSize));

      final samTextPainter =
          TextPainter(text: samTextSpan, textDirection: TextDirection.ltr);

      samTextPainter.layout(minWidth: 0, maxWidth: size.width);
      samTextPainter.paint(
          canvas,
          Offset(
              size.width / 2 - samTextPainter.width / 2,
              (size.height / 2 - tmRadius) -
                  ((samRadius - tmRadius) / 2) -
                  samTextPainter.height / 4));

      //Drawing text for tam(Outer Text)
      final tamTextSpan = TextSpan(
          text: convertDataValues(tamChartData!.tam).toString(),
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

TamPositions? stringToTamPosition(String tamPosition) {
  switch (tamPosition) {
    case 'top':
      return TamPositions.top;
    case 'bottom':
      return TamPositions.bottom;
    case 'left':
      return TamPositions.left;
    case 'right':
      return TamPositions.right;
    default:
      return null;
  }
}


convertDataValues(double data) {
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

createAnimatedCircle(Paint paint, Canvas canvas, Color color, double angle, Size size, double radius){
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
        Rect.fromCenter(center: Offset(size.width / 2, size.height - radius), width: 2*radius, height: 2*radius),
        segmentStartAngle,
        currentSweep,
        true,
        paint,
      );
    }
}
