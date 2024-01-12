import 'package:flutter/material.dart';

import 'brut_colors.dart';

const BoxShadow shadowBiggerBrut = BoxShadow(
  color: Colors.black, // Opacidad del 100%
  offset: Offset(12, 12), // Offset X, Y
  blurRadius: 0, // No blur
);

const BoxShadow shadowBigBrut =  BoxShadow(
  color: Colors.black, // Opacidad del 100%
  offset: Offset(8, 8), // Offset X, Y
  blurRadius: 0, // No blur
);

const BoxShadow shadowMediumBrut = BoxShadow(
  color: Colors.black, // Opacidad del 100%
  offset: Offset(4, 4), // Offset X, Y
  blurRadius: 0, // No blur
);

const BoxShadow shadowSmallBrut = BoxShadow(
  color: Colors.black, // Opacidad del 100%
  offset: Offset(2, 2), // Offset X, Y
  blurRadius: 0, // No blur
);

Border brutBorderNormal = Border.all( color: BrutColors.blackBrown, width: 2,);
Border brutBorderBig = Border.all( color: Colors.black, width: 4,);
