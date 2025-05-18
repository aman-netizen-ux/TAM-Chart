import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:tam_chart/src/export/platform/file_saver_stub.dart'
  if (dart.library.html) 'package:tam_chart/src/export/platform/file_saver_web.dart'
  if (dart.library.io) 'package:tam_chart/src/export/platform/file_saver_io.dart';

/// A utility class that provides methods to export a TAM chart as an image.
///
/// The [TAMChartExport] class includes functionality to:
/// - Capture a widget as a PNG image using a [GlobalKey]
/// - Save the captured image to the device’s file system or browser downloads
class TAMChartExport {
  /// Captures the widget wrapped in a [RepaintBoundary] as a PNG image.
  ///
  /// This function takes a [GlobalKey] pointing to a [RepaintBoundary] and returns
  /// the captured widget as a [Uint8List] of PNG bytes.
  ///
  /// Example:
  /// ```dart
  /// final imageBytes = await TAMChartExport.captureAsImage(chartKey);
  /// ```
  ///
  /// Returns `null` if capturing fails.
  static Future<Uint8List?> captureAsImage(GlobalKey imageKey) async {
    try {
      final RenderRepaintBoundary boundary =
          imageKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);

      return byteData?.buffer.asUint8List();
    } catch (e) {
      debugPrint('TAMChartExport.captureAsImage error: $e');
      return null;
    }
  }

  /// Saves the captured image bytes to the platform-specific storage system.
  ///
  /// This function uses conditional imports to save the PNG image:
  /// - On mobile/desktop: saved to file system (Downloads/Documents)
  /// - On web: triggers a browser download
  ///
  /// Provide a [fileName] (default: `'tam_chart.png'`) to name the saved file.
  ///
  /// Returns `true` if the file is saved successfully, otherwise `false`.
  static Future<bool?> saveImageToFile(
    Uint8List imageBytes, {
    String fileName = 'tam_chart',
  }) async {
    try {
      return await saveImage(imageBytes, fileName);
    } catch (e) {
      debugPrint('TAMChartExport.saveImageToFile error: $e');
      return false;
    }
  }
}
