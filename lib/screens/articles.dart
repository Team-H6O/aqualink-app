import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/simpleAppbar.dart';
import 'package:aqualink/widgets/article.dart';
import 'package:aqualink/widgets/filter.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
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
      ),
    );
  }
}
