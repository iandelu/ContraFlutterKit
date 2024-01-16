import 'package:flutter/material.dart';
import 'package:contraflutterkit/brutalism_theme/assets/brut_colors.dart';
import 'package:contraflutterkit/brutalism_theme/assets/brut_shadows.dart';
import 'package:contraflutterkit/brutalism_theme/assets/brut_texts.dart';
import 'package:contraflutterkit/brutalism_theme/assets/dimensions.dart';

class BrutButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final Color color;
  final Color borderColor;
  final Color disabledColor;
  final Color textColor;
  final double borderRadius;
  final bool isEnabled;
  final double elevation;
  final double disabledElevation;
  final BoxShadow boxShadow;
  final TextStyle textStyle;



  const BrutButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = BrutColors.primaryBlue,
    this.borderColor = BrutColors.blackBrown,
    this.disabledColor = BrutColors.lightGrey,
    this.textColor = Colors.white,
    this.borderRadius = 4.0,
    this.isEnabled = true,
    this.elevation = 2.0,
    this.disabledElevation = 0.0,
    this.boxShadow = shadowBigBrut,
    this.textStyle = BrutTexts.h3,
    this.width = double.infinity,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    boxShadow ?? shadowMediumBrut;
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(BrutDimensions.brutBorderRadious),
        border: Border.all( color: borderColor, width: 2,),
        boxShadow: [boxShadow],
      ),

      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BrutDimensions.brutBorderRadious),
        ),
        elevation: 0.0,
        child: Text(text, style: textStyle),
      ),
    );
  }
}


class BrutIconButton extends StatefulWidget {
  final Color buttonColor;
  final BoxShadow boxShadow;
  final IconData iconData;
  final double iconSize;
  final double width;
  final double height;
  final bool rounded;
  final bool isClickable;
  final VoidCallback? onPressed;
  final Color iconColor;

  const BrutIconButton({
    Key? key,
    required this.iconData,
    this.onPressed,
    this.buttonColor = BrutColors.primaryRed,
    this.boxShadow = shadowMediumBrut,
    this.iconSize = 30.0,
    this.width = 40,
    this.height = 40,
    this.rounded = true,
    this.isClickable = true,
    this.iconColor = Colors.black
  }) : super(key: key);

  @override
  _BrutIconButtonState createState() => _BrutIconButtonState();
}

class _BrutIconButtonState extends State<BrutIconButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: 0.8,
      upperBound: 1.0,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.isClickable) {
      _animationController.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.isClickable) {
      _animationController.reverse();
      widget.onPressed;
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.boxShadow ?? shadowBigBrut;

    //Control if is rounded or rectanguled
    BoxShape shape = BoxShape.circle;
    if(!widget.rounded) {
      shape = BoxShape.rectangle;
    }
    return GestureDetector(
      onTapDown: widget.isClickable ? _onTapDown : null,
      onTapUp: widget.isClickable ? _onTapUp : null,
      onTap: widget.isClickable ? widget.onPressed: null,

      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                border: brutBorderNormal,
                color: widget.buttonColor,
                shape: shape,
                boxShadow: [widget.boxShadow],
              ),
              child: Icon(
                widget.iconData,
                size: widget.iconSize,
                color: widget.iconColor,
              ),
            ),
          );
        },
      ),
    );
  }
}



