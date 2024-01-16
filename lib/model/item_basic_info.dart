import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class ItemBasicInfo {
  final int id;
  final String name;
  final String by;
  final Color bgColor;
  final String extra;
  final Widget? extraWidget;
  final Uint8List image;
  final bool? isFavorite;

  const ItemBasicInfo(
      {required this.name,
      required this.extra,
      required this.by,
      required this.bgColor,
      required this.id,
      this.extraWidget,
      required this.image,
      this.isFavorite,});
}
