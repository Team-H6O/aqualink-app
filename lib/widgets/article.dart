import 'package:flutter/material.dart';
import 'package:aqualink/utils/theme.dart';

class Article extends StatelessWidget {
  // Propriétés du widget
  final String title;
  final String description;
  final String path;

  // Constructeur
  const Article({Key? key, required this.title, required this.description, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retourne la structure du widget
    return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppTheme.whiteColor,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35),
                              ),
                              child: Image.network(
                                path,
                                width: double.infinity,
                                height: 175,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: AppTheme.headline3Size,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: Text(
                                  description,
                                  style: TextStyle(
                                    fontSize: AppTheme.headline6Size,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
  }
}
