import 'dart:typed_data';

/// Stub implementation of [saveImage] for unsupported platforms.
///
/// This is used as a fallback when no suitable platform-specific
/// implementation is available (e.g., during tests or build errors).
///
/// Throws [UnsupportedError] when invoked.
Future<bool?> saveImage(Uint8List bytes, String fileName) async {
  throw UnsupportedError('Saving files is not supported on this platform.');
}
