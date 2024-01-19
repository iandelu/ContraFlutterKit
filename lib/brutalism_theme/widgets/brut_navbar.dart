import 'package:flutter/material.dart';
import 'package:contraflutterkit/brutalism_theme/assets/brut_colors.dart';
import 'package:contraflutterkit/brutalism_theme/assets/brut_shadows.dart';
import 'package:contraflutterkit/brutalism_theme/assets/dimensions.dart';

class NavBarItem {
  final IconData icon;
  final String label;
  final  destination;

  NavBarItem({
    required this.icon,
    required this.label,
    required this.destination,
  });
}

/*final navMenus = <NavBarItem>[
  NavBarItem(
    icon: Icons.home,
    label: 'Home',
    destination: ,
  ),
  NavBarItem(
    icon: Icons.calendar_today,
    label: 'Planner',
    destination: ,
  ),
  NavBarItem(
    icon: Icons.ac_unit,
    label: 'Pantry',
    destination: ,
  ),
  NavBarItem(
    icon: Icons.shopping_cart,
    label: 'Shop',
    destination: ,
  ),
  NavBarItem(
    icon: Icons.person,
    label: 'Profile',
    destination: ,
  ),
];*/

class BrutNavBar extends StatefulWidget {
  final List<NavBarItem> items;
  final Color defaultColor;
  final Color activeColor;

  const BrutNavBar({
    Key? key,
    required this.items,
    this.defaultColor = BrutColors.purpleHeart,
    this.activeColor = BrutColors.electricLime,
  }) : super(key: key);

  @override
  State<BrutNavBar> createState() => _BrutNavBarState();
}

class _BrutNavBarState extends State<BrutNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget.items[index].destination),
    );
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
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(BrutDimensions.brutBorderRadious),
            topRight: Radius.circular(BrutDimensions.brutBorderRadious),
          ),
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
