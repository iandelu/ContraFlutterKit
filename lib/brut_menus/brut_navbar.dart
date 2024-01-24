import 'package:contraflutterkit/model/navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:contraflutterkit/brutalism_theme/assets/brut_colors.dart';
import 'package:contraflutterkit/brutalism_theme/assets/brut_shadows.dart';
import 'package:contraflutterkit/brutalism_theme/assets/dimensions.dart';


class BrutNavBar extends StatefulWidget {
  final List<NavItem> items;
  final int currentIndex;
  final Color defaultColor;
  final Color activeColor;
  final ValueChanged<int> onItemTapped;

  const BrutNavBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    this.defaultColor = BrutColors.purpleHeart,
    this.activeColor = BrutColors.electricLime,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<BrutNavBar> createState() => _BrutNavBarState();
}

class _BrutNavBarState extends State<BrutNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.currentIndex;
    });

  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      padding: EdgeInsets.zero,
      shape: const CircularNotchedRectangle(),
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          color: widget.defaultColor,
          boxShadow: const [shadowMediumBrut],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.items.length, (index) {
            var item = widget.items[index];
            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  border: _selectedIndex == index ? brutBorderNormal : Border.all(color: Colors.transparent), // Change the border if selected
                  color: _selectedIndex == index ? widget.activeColor : widget.defaultColor, // Change the background color if selected
                  borderRadius: BorderRadius.circular(BrutDimensions.brutBorderRadious),
                  boxShadow: _selectedIndex == index ? [shadowMediumBrut] : [], // Change the shadow if selected
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Icon(
                  item.icon,
                  color: _selectedIndex == index ? BrutColors.blackBrown : BrutColors.smokyWhite,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
