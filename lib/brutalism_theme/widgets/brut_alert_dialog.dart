import 'package:contraflutterkit/brutalism_theme/assets/brut_colors.dart';
import 'package:flutter/material.dart';

class BrutAlertWidget extends StatelessWidget {
  final String message;
  final bool hasTwoButtons;
  final String button1Text;
  final String button2Text;
  final VoidCallback button1OnPressed;
  final VoidCallback? button2OnPressed;
  final Color messageBoxColor;
  final Color buttonColor;
  final Color buttonTextColor;
  final double? width;
  final double? height;
  final BoxShadow boxShadow;

  const BrutAlertWidget({
    Key? key,
    required this.message,
    this.hasTwoButtons = false,
    required this.button1Text,
    this.button2Text = '',
    required this.button1OnPressed,
    this.button2OnPressed,
    this.messageBoxColor = Colors.black,
    this.buttonColor = BrutColors.primaryBlue,
    this.buttonTextColor = Colors.black,
    this.width,
    this.height,
    required this.boxShadow
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8.0),
      color: messageBoxColor,
      decoration: BoxDecoration(
        color: messageBoxColor,
        boxShadow: [boxShadow], // Utilizamos la sombra pasada como parámetro
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 16.0),
          if (hasTwoButtons) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: button1OnPressed,
                  child: Text(button1Text),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                    foregroundColor: MaterialStateProperty.all(buttonTextColor),
                  ),
                ),
                ElevatedButton(
                  onPressed: button2OnPressed ?? () {},
                  child: Text(button2Text),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(buttonColor),
                    foregroundColor: MaterialStateProperty.all(buttonTextColor),
                  ),
                ),
              ],
            ),
          ] else ...[
            Center(
              child: ElevatedButton(
                onPressed: button1OnPressed,
                child: Text(button1Text),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(buttonColor),
                  foregroundColor: MaterialStateProperty.all(buttonTextColor),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
