import 'package:flutter/material.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/screens/articles.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.equalizer),
          label: 'Statistique',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compare_arrows),
          label: 'Comparaison',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Articles',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: AppTheme.darkPrimaryColor,
      unselectedItemColor: AppTheme.lightGrayColor,
      onTap: onItemTapped,
    );
  }
}
