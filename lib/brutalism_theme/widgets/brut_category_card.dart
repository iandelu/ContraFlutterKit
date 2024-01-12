import 'package:flutter/material.dart';
import 'package:contraflutterkit/brutalism_theme/assets//brut_shadows.dart';

class BrutCategoryWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final double borderRadius;
  final BoxShadow boxShadow;
  final String iconPath;
  final String categoryName;
  final TextStyle textStyle;

  const BrutCategoryWidget({
    Key? key,
    this.width = 90,
    this.height = 90,
    required this.backgroundColor,
    required this.borderRadius,
    required this.boxShadow,
    required this.iconPath,
    required this.categoryName,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: brutBorderNormal,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [boxShadow],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: width * 0.75,
            height: height * 0.5,
            child: Image(
              image: AssetImage(iconPath),
            ),
          ),
          Text(categoryName, style: textStyle),
        ],
      ),
    );
  }
}
