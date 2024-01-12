import 'package:flutter/material.dart';

class BrutFloatingButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final Color iconColor;
  final double size;
  final ShapeBorder shape;
  final List<BoxShadow>? boxShadow;

  const BrutFloatingButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color = Colors.yellow,
    this.iconColor = Colors.black,
    this.size = 48.0,
    this.shape = const CircleBorder(),
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: shape is CircleBorder ? BoxShape.circle : BoxShape.rectangle,
        boxShadow: boxShadow,
      ),
      child: IconButton(
        icon: Icon(icon),
        color: iconColor,
        onPressed: onPressed,
      ),
    );
  }
}

class BrutCheckbox extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color checkColor;
  final double size;

  const BrutCheckbox({
    Key? key,
    required this.isChecked,
    required this.onChanged,
    this.activeColor = Colors.purple,
    this.checkColor = Colors.black,
    this.size = 24.0,
  }) : super(key: key);

  @override
  _BrutCheckboxState createState() => _BrutCheckboxState();
}

class _BrutCheckboxState extends State<BrutCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  void _toggleChecked() {
    setState(() {
      _isChecked = !_isChecked;
    });
    widget.onChanged(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleChecked,
      child: Container(
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
          color: _isChecked ? widget.activeColor : Colors.transparent,
          border: Border.all(
            color: _isChecked ? Colors.transparent : widget.activeColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: _isChecked
            ? Icon(
                Icons.check,
                color: widget.checkColor,
                size: widget.size * 0.6, // Icon size is 60% of the container size
              )
            : null,
      ),
    );
  }
}

class BrutRadioButton extends StatelessWidget {
  final double size;
  final Color borderColor;
  final Color fillColor;
  final double borderWidth;
  final List<BoxShadow>? boxShadow;

  const BrutRadioButton({
    Key? key,
    this.size = 24.0,
    this.borderColor = Colors.black,
    this.fillColor = Colors.transparent,
    this.borderWidth = 2.0,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fillColor,
        border: Border.all(color: borderColor, width: borderWidth),
        boxShadow: boxShadow,
      ),
    );
  }
}

class BrutToggleSwitch extends StatefulWidget {
  final bool isToggled;
  final ValueChanged<bool> onToggle;
  final Color activeColor;
  final Color inactiveColor;
  final Color toggleColor;
  final double width;
  final double height;
  final List<BoxShadow>? boxShadow;

  const BrutToggleSwitch({
    Key? key,
    required this.isToggled,
    required this.onToggle,
    this.activeColor = Colors.grey,
    this.inactiveColor = Colors.black,
    this.toggleColor = Colors.white,
    this.width = 70.0,
    this.height = 35.0,
    this.boxShadow,
  }) : super(key: key);

  @override
  _BrutToggleSwitchState createState() => _BrutToggleSwitchState();
}

class _BrutToggleSwitchState extends State<BrutToggleSwitch> {
  late bool _isToggled;

  @override
  void initState() {
    super.initState();
    _isToggled = widget.isToggled;
  }

  void _handleTap() {
    setState(() {
      _isToggled = !_isToggled;
    });
    widget.onToggle(_isToggled);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: _isToggled ? widget.activeColor : widget.inactiveColor,
          borderRadius: BorderRadius.circular(widget.height / 2), // Ensures the container is a pill shape
          boxShadow: widget.boxShadow,
        ),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 250),
          curve: Curves.easeIn,
          alignment: _isToggled ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: widget.height - 8, // Subtract the padding from the height to get the circle size
              height: widget.height - 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.toggleColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
