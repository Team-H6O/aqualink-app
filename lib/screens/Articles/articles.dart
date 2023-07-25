import 'package:flutter/material.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/Appbar/simpleAppbar.dart';
import 'package:aqualink/widgets/Articles/article.dart';
import 'package:aqualink/widgets/Articles/filter.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  String selectedCategory = 'Tous';
  List<Map<String, dynamic>> filteredArticles = [];
  List<Map<String, dynamic>> allArticles = [
    {
      'title': 'Article 1',
      'description':
          'Article 1 is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard...',
      'categorie': "Filtre 1",
      'path': 'https://picsum.photos/seed/175/600',
    },
    {
      'title': 'Article 2',
      'description':
          'Article 2 is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard...',
      'categorie': "Filtre 2",
      'path': 'https://picsum.photos/seed/176/600',
    },
    {
      'title': 'Article 3',
      'description':
          'Article 3 is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard...',
      'categorie': "Filtre 3",
      'path': 'https://picsum.photos/seed/177/600',
    },
  ];

  List<Widget> filterArticles(String category) {
    if (category == 'Tous') {
      return allArticles.map((articleData) {
        return Article(
          title: articleData['title'],
          description: articleData['description'],
          categorie: articleData['categorie'],
          path: articleData['path'],
        );
      }).toList();
    } else {
      return allArticles
          .where((articleData) => articleData['categorie'] == category)
          .map((articleData) {
        return Article(
          title: articleData['title'],
          description: articleData['description'],
          categorie: articleData['categorie'],
          path: articleData['path'],
        );
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: AppTheme.nearWhiteColor,
        appBar: const SimpleAppBar(title: 'Articles'),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: HorizontalFilter(
                    onCategorySelected: (category) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    selectedCategory: selectedCategory,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: filterArticles(
                        selectedCategory), // Call the function to filter the articles based on the selected category
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
