import 'package:contraflutterkit/onboarding/type2/onboard_page_two.dart';
import 'package:contraflutterkit/utils/strings.dart';
import 'package:flutter/cupertino.dart';

class OnboardData {
  final String placeHolder;
  final String title;
  final String description;

  const OnboardData(
      {required this.placeHolder,
      required this.title,
      required this.description});

  static List<Widget> demoIntroWidgets = [
    const OnboardPageTypeTwo(
      data: OnboardData(
          placeHolder: "assets/images/onboarding_image_one.svg",
          title: Strings.contra_wireframe_kit,
          description: Strings.contra_wireframe_kit_page_text),
    ),
    const OnboardPageTypeTwo(
      data: OnboardData(
          placeHolder: "assets/images/onboarding_image_two.svg",
          title: Strings.contra_wireframe_kit,
          description: Strings.contra_wireframe_kit_page_text),
    ),
    const OnboardPageTypeTwo(
      data: OnboardData(
          placeHolder: "assets/images/onboarding_image_three.svg",
          title: Strings.contra_wireframe_kit,
          description: Strings.contra_wireframe_kit_page_text),
    ),
  ];
}
