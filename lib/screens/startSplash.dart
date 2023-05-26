import 'dart:async';
import 'package:aqualink/screens/landing.dart';
import 'package:flutter/material.dart';

class StartSplash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StartSplashState();
  }
}

class _StartSplashState extends State<StartSplash> {
  @override
  void initState() {
    super.initState();
    // Temps de chargement souhaité
    Timer(const Duration(seconds: 2), () {
      // Naviguer vers la prochaine page (par exemple, la page d'accueil)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Landing()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // ou tout autre contenu de chargement
      ),
    );
  }
}