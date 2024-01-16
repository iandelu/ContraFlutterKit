import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ItemBasicInfo {
  final String name;
  final String by;
  final Color bgColor;
  final String extra;
  final Widget? extraWidget;
  final Int8List? image;

  const ItemBasicInfo(

      {required this.name,
      required this.extra,
      required this.by,
      required this.bgColor,
      this.extraWidget,
      this.image,});
}
