 import 'package:flutter/material.dart';

BottomNavigationBarItem buildBottonNavItem({
    required String iconPath,
    required String activeIconPath,
  }) {
    return BottomNavigationBarItem(
      label: ' ',
      icon: SizedBox(
        width: 20.0,
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage(iconPath),
        ),
      ),
      activeIcon: SizedBox(
        width: 20.0,
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage(
            activeIconPath,
          ),
        ),
      ),
    );
  }