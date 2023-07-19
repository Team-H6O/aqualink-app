import 'package:flutter/material.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/screens/navigation.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const SimpleAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconTheme(
        data: IconThemeData(size: 40, color: AppTheme.blackColor),
        child: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Navigation()),
            );
          },
        ),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: AppTheme.headline4Size,
          fontWeight: FontWeight.w500,
          color: AppTheme.blackColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.0); // Hauteur personnalisée
}
