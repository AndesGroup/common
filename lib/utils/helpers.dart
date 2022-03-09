import 'package:validators/validators.dart';

enum MediaType {
  network,
  asset,
  file,
}

MediaType getMediaType(String? mediaSrc) {
  if (isURL(mediaSrc, allowUnderscore: true)) {
    return MediaType.network;
  } else if (mediaSrc!.startsWith('assets')) {
    return MediaType.asset;
  } else if (mediaSrc.startsWith('files')) {
    return MediaType.file;
  } else {
    throw Exception('Invalid Media Type');
  }
}