import 'dart:io';
import 'dart:typed_data';

/// Saves the image bytes to the Downloads folder on mobile or desktop.
///
/// This function writes [bytes] to a file with the given [fileName]
/// in `/storage/emulated/0/Download`, which is standard for Android.
///
/// Returns `true` if the file is saved successfully, otherwise `false`.
Future<bool?> saveImage(Uint8List bytes, String fileName) async {
  try {
    const dir = '/storage/emulated/0/Download'; // Android Downloads directory
    final path = '$dir/${fileName}_${DateTime.now().millisecondsSinceEpoch}.png';
    final file = File(path);
    await file.writeAsBytes(bytes);
    return true;
  } catch (e) {
    return false;
  }
}
