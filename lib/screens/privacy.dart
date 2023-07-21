import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/returnAppbar.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: AppTheme.nearWhiteColor,
        appBar: ReturnAppBar(title: 'Politique de confidentialité'),
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
                'Introduction',
                style: TextStyle(
                  fontSize: AppTheme.headline3Size,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Cette politique de confidentialité explique comment AQUALINK, notre application '
                'de gestion de la consommation d\'eau, recueille, utilise et protège les informations personnelles que vous nous fournissez. '
                'En utilisant l\'application AQUALINK, vous acceptez les pratiques décrites dans cette politique.',
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Collecte et utilisation des informations',
                style: TextStyle(
                  fontSize: AppTheme.headline5Size,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'AQUALINK peut collecter des informations personnelles telles que votre nom, adresse email, '
                'numéro de téléphone, etc. lorsque vous vous inscrivez à l\'application ou utilisez '
                'nos services. Ces informations sont utilisées pour vous identifier en tant qu\'utilisateur, '
                'vous fournir un accès à nos services et vous contacter concernant les relevés de consommation '
                'd\'eau, les mises à jour ou les informations importantes concernant l\'application.',
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Cookies et technologies similaires',
                style: TextStyle(
                  fontSize: AppTheme.headline5Size,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'L\'application AQUALINK peut utiliser des cookies et d\'autres technologies similaires '
                'pour améliorer votre expérience utilisateur. Les cookies sont de petits fichiers '
                'textes placés sur votre appareil lorsque vous accédez à l\'application. Ils nous '
                'permettent de vous reconnaître et de mémoriser certaines informations pour faciliter '
                'votre navigation et personnaliser votre expérience.',
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Sécurité',
                style: TextStyle(
                  fontSize: AppTheme.headline5Size,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'AQUALINK prend la sécurité de vos informations personnelles au sérieux. '
                'Nous mettons en œuvre des mesures de sécurité pour protéger vos informations '
                'contre tout accès, divulgation, altération ou destruction non autorisé. '
                'Cependant, veuillez noter qu\'aucune méthode de transmission sur Internet '
                'ou de stockage électronique n\'est totalement sécurisée, et nous ne pouvons '
                'pas garantir une sécurité absolue.',
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Modifications de la politique de confidentialité',
                style: TextStyle(
                  fontSize: AppTheme.headline5Size,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'AQUALINK se réserve le droit de modifier cette politique de confidentialité '
                'à tout moment. Toute modification sera effective dès sa publication dans '
                'l\'application. Nous vous encourageons à consulter régulièrement cette '
                'page pour rester informé des mises à jour.',
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Contact',
                style: TextStyle(
                  fontSize: AppTheme.headline5Size,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Si vous avez des questions ou des préoccupations concernant cette politique de '
                'confidentialité ou nos pratiques en matière de confidentialité, veuillez nous '
                'contacter à l\'adresse email suivante : contact@aqualink.com.',
                style: TextStyle(
                  fontSize: AppTheme.bodyText1Size,
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
