import 'dart:async';
import 'package:aqualink/screens/landing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartSplashScreen(), // Utilise StartSplashScreen comme page d'accueil
    );
  }
}

class StartSplashScreen extends StatefulWidget {
  @override
  _StartSplashScreenState createState() => _StartSplashScreenState();
}

class _StartSplashScreenState extends State<StartSplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLanding(); // Appeler la fonction pour naviguer vers Landing() après une attente
  }

  void navigateToLanding() async {
    await Future.delayed(Duration(seconds: 2)); // Simuler une attente de 2 secondes

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Landing()), // Naviguer vers la page Landing()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon application'),
      ),
      body: Center(
        child: Text('Écran de chargement'),
      ),
    );
  }
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landing'),
      ),
      body: Center(
        child: Text('Page Landing'),
      ),
    );
  }
}
