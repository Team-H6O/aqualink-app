import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/simpleAppbar.dart';
import 'package:aqualink/widgets/bottomNavigationbar.dart';
import 'package:aqualink/widgets/article.dart';
import 'package:aqualink/widgets/filter.dart';
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: HorizontalFilter(),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Article(
                          title: 'Article 1',
                          description:
                              'Article 1 is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard...',
                          path: 'https://picsum.photos/seed/175/600'),
                      Article(
                          title: 'Article 2',
                          description:
                              'Article 2 is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard...',
                          path: 'https://picsum.photos/seed/176/600'),
                      Article(
                          title: 'Article 3',
                          description:
                              'Article 3 is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard...',
                          path: 'https://picsum.photos/seed/177/600'),
                    ],
                  ),
                ),
              ],
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
}
