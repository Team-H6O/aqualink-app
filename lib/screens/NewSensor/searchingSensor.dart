import 'package:flutter/material.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/Appbar/returnAppbar.dart';
import 'package:aqualink/screens/NewSensor/addSensor.dart';
import 'package:aqualink/screens/NewSensor/listSensors.dart';

class SearchingSensorPage extends StatefulWidget {
  const SearchingSensorPage({Key, key}) : super(key: key);

  @override
  State<SearchingSensorPage> createState() => _SearchingSensorPageState();
}

class _SearchingSensorPageState extends State<SearchingSensorPage> {
  String _loadingText = 'capteurs';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startLoadingAnimation();

    Future.delayed(Duration(seconds: 7), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ListSensorsPage()),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startLoadingAnimation() {
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _loadingText = _loadingText.length < 11 ? '$_loadingText.' : 'capteurs';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: AppTheme.nearWhiteColor,
        appBar: ReturnAppBar(title: ''),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 150,
              ),
              Stack(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: AppTheme.nearWhiteColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo/logo_addSensor.png',
                          width: 110,
                          height: 110,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: SizedBox(
                  width: 135, // Prend 100% de la largeur disponible
                  child: Text(
                    'Recherche des',
                    style: TextStyle(
                        fontSize: AppTheme.headline5Size,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.darkPrimaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 85, // Ajuster la largeur souhaitée ici
                child: Text(
                  _loadingText,
                  style: TextStyle(
                      fontSize: AppTheme.headline5Size,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.darkPrimaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
