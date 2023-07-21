import 'package:flutter/material.dart';
import 'dart:async';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/Appbar/returnAppbar.dart';
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
              const SizedBox(
                height: 150,
              ),
              Stack(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
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
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: SizedBox(
                  width: 135,
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
                width: 85,
                child: Text(
                  _loadingText,
                  style: const TextStyle(
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
