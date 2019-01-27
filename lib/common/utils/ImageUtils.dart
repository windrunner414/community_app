import 'package:flutter/material.dart';

ImageProvider getImageProvider(String uri) {
  if (uri.substring(0, 9) == 'assets://') {
    return AssetImage(uri.substring(9));
  } else {
    return NetworkImage(uri);
  }
}