import 'package:flutter/material.dart';
import 'package:aqualink/utils/theme.dart';

class Article extends StatelessWidget {
  // Propriétés du widget
  final String title;
  final String description;
  final String categorie;
  final String path;

  // Constructeur
  const Article(
      {Key? key,
      required this.title,
      required this.description,
      required this.categorie,
      required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retourne la structure du widget
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
      child: InkWell(
        onTap: () {
          _openModalBottomSheet(context, title, description, path);
        },
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
      ),
    );
  }

  void _openModalBottomSheet(BuildContext context, title, description, path) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
            height: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Ferme la fenêtre modale
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 15, 13),
                          child: Text(
                            'Fermer',
                            style: TextStyle(
                              fontSize: AppTheme.headline5Size,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.darkPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(children: <Widget>[
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            path, // Remplacez l'URL de l'image par votre propre URL
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: AppTheme.headline3Size,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: AppTheme.headline6Size,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: AppTheme.headline3Size,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: AppTheme.headline6Size,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: AppTheme.headline3Size,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: AppTheme.headline6Size,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: AppTheme.headline3Size,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: AppTheme.headline6Size,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                // Ajoutez ici d'autres widgets pour le contenu de l'article
              ],
            ),
          ),
        );
      },
    );
  }
}
