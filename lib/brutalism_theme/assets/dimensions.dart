import 'dart:ui';

import 'package:flutter/cupertino.dart';

class BrutDimensions{

  static FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

// Dimensions in physical pixels (px)
  static Size size = view.physicalSize;

  //GlOBAL PARAMETERS
  static double screenHeight = 844;
  static double screenWidth =  390;

  static double oneThirdScreenHeight = screenHeight/3;
  static double twoThirdScreenHeight = screenHeight*(2/3);

  static double pageViewContainer = screenHeight/2.64;
  static double pageViewMediumContainer = screenHeight/3.84;
  static double pageViewSmallContainer = screenHeight/7.03; //120

  //Dynamic Heights
  static double height10 = screenHeight/84.4;
  static double height20 = screenHeight/42.2;
  static double height15 = screenHeight/56.7;
  static double height30 = screenHeight/28.13;
  static double height50 = screenHeight/16.88;
  static double height100 = screenHeight/8.44;
  static double height150 = screenHeight/5.63;

  //Dynamic Widths
  static double width10 = screenWidth/39;
  static double width15 = screenWidth/26;
  static double width20 = screenWidth/19.5;
  static double width30 = screenWidth/13;
  static double width50 = screenWidth/7.8;
  static double width100 = screenWidth/3.9;


  //FontSizes
  static double font20 = screenWidth/25.2;
  static double font12 = screenWidth/40.33;

  //radius
  static double brutBorderRadious = 12;

  //iconSize
  static double iconSize16 = screenHeight/52.76;

  //Recipes
  static double recipeImageSize = screenHeight*0.4;
  static double popularFoodTextSize = screenHeight*0.6;



  static double heightRSize(double value){
      double factor = 844/value;
      return screenHeight/factor;
  }

  static double widthRSize(double value){
      double factor = 390/value;
      return screenWidth/factor;
  }

}