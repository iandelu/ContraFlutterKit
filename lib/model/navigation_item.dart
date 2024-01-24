import 'package:flutter/material.dart';

class NavItem {
  final String label;
  final IconData? icon;
  final Function? navigation;

  NavItem({
    required this.label,
    this.icon,
    this.navigation,
  });
}