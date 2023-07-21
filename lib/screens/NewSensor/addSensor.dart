import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/Appbar/returnAppbar.dart';
import 'package:aqualink/screens/NewSensor/searchingSensor.dart';

class AddSensorPage extends StatefulWidget {
  const AddSensorPage({Key, key}) : super(key: key);

  @override
  State<AddSensorPage> createState() => _AddSensorPageState();
}

class _AddSensorPageState extends State<AddSensorPage> {
  TextEditingController _textEditingController = TextEditingController();

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            title: Text(
              'Utiliser un numéro de série',
              style: TextStyle(
                fontSize: AppTheme.bodyText1Size,
                fontWeight: FontWeight.w800,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Trouvez le capteur à l’aide de son numéro de série à 6 caractères.',
                  style: TextStyle(fontSize: AppTheme.captionSize),
                ),
                TextField(
                  controller: _textEditingController,
                  style: TextStyle(
                    fontSize: AppTheme.subtitle1Size,
                    color: AppTheme.blackColor,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Numéro de série',
                    suffixIcon: IconButton(
                      padding: EdgeInsets.fromLTRB(
                          15, 15, 0, 0), // Réduction du padding du bouton croix
                      onPressed: () {
                        setState(() {
                          _textEditingController.clear();
                        });
                      },
                      icon: Container(
                        width: 16.0,
                        height: 16.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.grayColor,
                        ),
                        child: Icon(
                          Icons.clear,
                          size: 10.0,
                          color: AppTheme.whiteColor,
                        ),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTheme.darkPrimaryColor,
                      ),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  ),
                ),
              ],
            ),
            actions: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {
                      // Logique de recherche avec le numéro de série
                      String searchQuery = _textEditingController.text;
                      print(
                          'Rechercher avec le numéro de série : $searchQuery');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchingSensorPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 35),
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor: AppTheme.darkPrimaryColor,
                      textStyle: const TextStyle(
                        fontSize: AppTheme.bodyText2Size,
                        fontWeight: FontWeight.w600,
                      ),
                      elevation: 2,
                      side: BorderSide(color: Color(0x00FFFFFF)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Rechercher'),
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Annuler',
                    style: TextStyle(color: AppTheme.grayColor),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: AppTheme.nearWhiteColor,
        appBar: ReturnAppBar(title: ''),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 80),
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
              Text(
                'Ajouter un capteur',
                style: TextStyle(
                    fontSize: AppTheme.headline4Size,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Assurez-vous que le capteur que vous souhaitez ajouter est bien connecté à l’alimentation.',
                style: TextStyle(
                  fontSize: AppTheme.bodyText2Size,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: _showAlertDialog,
                child: Text('Rechercher avec un numéro de série'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45),
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: AppTheme.whiteColor,
                  textStyle: const TextStyle(
                    fontSize: AppTheme.headline6Size,
                    fontWeight: FontWeight.w600,
                  ),
                  foregroundColor: AppTheme.darkPrimaryColor,
                  elevation: 2,
                  side: BorderSide(color: Color(0x00FFFFFF)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchingSensorPage()),
                  );
                },
                child: Text('Rechercher'),
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
                  side: BorderSide(color: Color(0x00FFFFFF)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
