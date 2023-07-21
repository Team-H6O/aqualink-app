import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/returnAppbar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: AppTheme.nearWhiteColor,
        appBar: ReturnAppBar(title: 'À Propos'),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
              20, 0, 20, 0), // Ajoute un padding pour éviter le débordement
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                'AQUALINK',
                style: TextStyle(
                  fontSize: AppTheme.headline3Size,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                  color: AppTheme.grayColor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Description de l\'application :',
                style: TextStyle(
                  fontSize: AppTheme.headline5Size,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Aqualink est une application mobile destinée à aider les utilisateurs à gérer leur consommation d'eau de manière efficace et responsable.",
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "L'objectif de cette application est d'encourager les utilisateurs à adopter des habitudes de consommation responsables, tout en leur offrant une expérience engageante.",
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Collaborateurs :',
                style: TextStyle(
                  fontSize: AppTheme.headline5Size,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Dorianne ANDRIATSITOHAINA',
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Jacky TRUONG',
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Mathieu PARINET',
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Jonathan BOUNGNASENG',
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Pierre-Alexis MAERTEN',
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Contact :',
                style: TextStyle(
                  fontSize: AppTheme.headline5Size,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Email : contact@aqualink.com',
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              Text(
                'Téléphone : 01 00 00 00 00',
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo/logo_grey.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
