import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/simpleAppbar.dart';
import 'package:aqualink/widgets/bottomNavigationbar.dart';
import 'package:aqualink/widgets/article.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// import 'Articles_model.dart';
// export 'Articles_model.dart';

void main() {
  runApp(const Articles());
}

class Articles extends StatelessWidget {
  const Articles({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const ArticlesPage(title: 'Articles'),
    );
  }
}

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
    int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
Widget build(BuildContext context) {
  return GestureDetector(
    child: Scaffold(
      backgroundColor: AppTheme.nearWhiteColor,
      appBar: SimpleAppBar(title: 'Articles'),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _openModalBottomSheet(context);
                  },
                  child: Text('Ouvrir la fenêtre modale'),
                ),
                Article(title: 'Article 1', description: 'Article 1 is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard...', path: 'https://picsum.photos/seed/175/600'),
                Article(title: 'Article 2', description: 'Article 2 is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard...', path: 'https://picsum.photos/seed/176/600'),
                Article(title: 'Article 3', description: 'Article 3 is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard...', path: 'https://picsum.photos/seed/177/600'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
    ),
  );
}

void _openModalBottomSheet(BuildContext context) {
showModalBottomSheet(
  context: context,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(13),
        topRight: Radius.circular(13),
      ),
  ),
builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Ferme la fenêtre modale
                  },
                  child: Padding(padding: EdgeInsets.fromLTRB(0, 15, 15, 7), child:                  Text(
                    'Done',
                    style: TextStyle(
                    fontSize: AppTheme.headline5Size,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.darkPrimaryColor,
                  ),
                  ),),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://picsum.photos/seed/175/600', // Remplacez l'URL de l'image par votre propre URL
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0), child:
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            Text(
              'Titre de l\'article',
              style: TextStyle(
                    fontSize: AppTheme.headline3Size,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: 10),
            Text(
              'Description de l\'article',
              style: TextStyle(
                    fontSize: AppTheme.headline6Size,
                  ),
            ),
            SizedBox(height: 10),
            Text(
              'Sous-titre de l\'article',
              style: TextStyle(
                    fontSize: AppTheme.headline5Size,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: 10),
            Text(
              'Contenu de l\'article',
              style: TextStyle(
                    fontSize: AppTheme.headline6Size,
                  ),
            ),
              ],)
            ),

            // Ajoutez ici d'autres widgets pour le contenu de l'article
          ],
        ),
      );
    },
);
}

}
