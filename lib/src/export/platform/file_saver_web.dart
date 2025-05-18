import 'dart:typed_data';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

/// Saves the image as a downloadable file in web browsers.
///
/// This function creates a Blob URL from the image [bytes], generates a
/// hidden anchor element, and programmatically clicks it to trigger download.
///
/// Returns `true` if the file is downloaded successfully, otherwise `false`.
Future<bool?> saveImage(Uint8List bytes, String fileName) async {
  try {
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..style.display = 'none';

    html.document.body!.append(anchor);
    anchor.click();
    anchor.remove();
    html.Url.revokeObjectUrl(url);

    return true;
  } catch (e) {
    return false;
  }
}
