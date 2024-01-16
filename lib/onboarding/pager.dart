import 'dart:io';

import 'package:contraflutterkit/custom_widgets/button_round_with_shadow.dart';
import 'package:contraflutterkit/custom_widgets/circle_dot_widget.dart';
import 'package:contraflutterkit/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPager extends StatefulWidget {

  final List<Widget> introWidgetsList;

  const OnboardingPager({required this.introWidgetsList});
  @override
  _OnboardingPagerState createState() => _OnboardingPagerState();
}

class _OnboardingPagerState extends State<OnboardingPager> {
  late PageController _pageController;
  int currentPageValue = 0;
  int previousPageValue = 0;
  double _moveBar = 0.0;



  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageValue);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        PageView.builder(
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return widget.introWidgetsList[index];
          },
          onPageChanged: (int page) {
            animatePage(page);
          },
          itemCount:  widget.introWidgetsList.length,
          controller: _pageController,
        ),
        Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      for (int i = 0; i <  widget.introWidgetsList.length; i++)
                        if (i == currentPageValue) ...[
                          CircleDotWidget(
                            isActive: true,
                            color: flamingo,
                            borderColor: flamingo,
                          )
                        ] else
                          CircleDotWidget(
                            isActive: false,
                            color: white,
                            borderColor: wood_smoke,
                          ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_pageController.hasClients) {
                        if (currentPageValue < 2) {
                          _pageController.animateToPage(
                            currentPageValue + 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.pushNamed(context, "/home");
                        }
                      } else {
                        Navigator.pushNamed(context, "/home");
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                          shadows: [
                            BoxShadow(
                              color: wood_smoke,
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                4.0, // Move to bottom 5 Vertically
                              ),
                            )
                          ],
                          color: lightening_yellow,
                          shape: CircleBorder(
                              side: BorderSide(color: wood_smoke, width: 2))),
                      child: SvgPicture.asset("assets/icons/arrow_forward.svg"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        kIsWeb || Platform.isIOS
            ? Positioned(
                left: 24,
                top: 48,
                child: ButtonRoundWithShadow(
                    size: 48,
                    borderColor: wood_smoke,
                    color: white,
                    callback: () {
                      Navigator.pop(context);
                    },
                    shadowColor: wood_smoke,
                    iconPath: "assets/icons/close.svg"),
              )
            : SizedBox(),
      ],
    );
  }

  void animatePage(int page) {
    print('page is $page');

    currentPageValue = page;

    if (previousPageValue == 0) {
      previousPageValue = currentPageValue;
      _moveBar = _moveBar + 0.14;
    } else {
      if (previousPageValue < currentPageValue) {
        previousPageValue = currentPageValue;
        _moveBar = _moveBar + 0.14;
      } else {
        previousPageValue = currentPageValue;
        _moveBar = _moveBar - 0.14;
      }
    }

    setState(() {});
  }
}
