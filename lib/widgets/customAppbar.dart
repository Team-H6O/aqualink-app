import 'package:aqualink/screens/parameter.dart';
import 'package:flutter/material.dart';
import 'package:aqualink/screens/articles.dart';
import 'package:aqualink/screens/parameter.dart';
import 'package:aqualink/screens/addSensor.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return // Generated code for this Row Widget...
        Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 25, 15, 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddSensorPage()),
                );
              },
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                child: IconButton(
                  icon: const Icon(
                    Icons.replay,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                child: Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ParameterPage()),
                  );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/508/600',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.0); // Hauteur personnalisée
}
