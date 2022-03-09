import 'package:validators/validators.dart';

import '../config/const.dart';

enum MediaType {
  network,
  asset,
  file,
}

void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  if (isTesting == false) {
    logger.d(message, error, stackTrace);
  }
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
