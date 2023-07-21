import 'package:flutter/material.dart';
import 'package:aqualink/utils/theme.dart';

class ReturnAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const ReturnAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconTheme(
        data: const IconThemeData(size: 40, color: AppTheme.blackColor),
        child: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
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
