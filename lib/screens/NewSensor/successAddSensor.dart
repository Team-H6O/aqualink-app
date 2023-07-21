import 'package:flutter/material.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/screens/Navigation/navigation.dart';

class SuccessAddSensorPage extends StatefulWidget {
  const SuccessAddSensorPage({Key, key}) : super(key: key);

  @override
  State<SuccessAddSensorPage> createState() => _SuccessAddSensorPageState();
}

class _SuccessAddSensorPageState extends State<SuccessAddSensorPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: AppTheme.nearWhiteColor,
        body: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  Image.asset(
                    'assets/logo/logo_success.png',
                    width: 130,
                    height: 130,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Votre capteur a bien été ajouté !',
                    style: TextStyle(
                        fontSize: AppTheme.headline3Size,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.darkPrimaryColor),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    "Vous pouvez dès à présent consulter les données relevées par ce dernier, ainsi que configurer ses seuils d'alerte.",
                    style: TextStyle(
                        fontSize: AppTheme.headline6Size,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.darkPrimaryColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Navigation()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 45),
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor: AppTheme.darkPrimaryColor,
                      textStyle: const TextStyle(
                        fontSize: AppTheme.headline6Size,
                        fontWeight: FontWeight.w600,
                      ),
                      elevation: 2,
                      side: const BorderSide(color: Color(0x00FFFFFF)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text("Retourner à la page d'accueil"),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
