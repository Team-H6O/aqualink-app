import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/Appbar/returnAppbar.dart';
import 'package:aqualink/screens/NewSensor/sensorChooseEquipment.dart';

class SensorChooseRoomPage extends StatefulWidget {
  final String title;
  const SensorChooseRoomPage({Key? key, required this.title}) : super(key: key);

  @override
  State<SensorChooseRoomPage> createState() => _SensorChooseRoomPageState();
}

class _SensorChooseRoomPageState extends State<SensorChooseRoomPage> {
  String _pageTitle = "";

  @override
  void initState() {
    super.initState();
    _pageTitle = widget.title;
  }

  final List<String> sensorsList = [
    'Cuisine',
    'Salle à manger',
    'Salle de bain',
    "Salle d'eau",
    'Buanderie',
    'Garage',
    'Sous-sol',
    'Grenier',
    'Cellier',
    'Jardin',
    'Pièce personnalisée'
  ];

  TextEditingController _textEditingController = TextEditingController();

  void _customRoomAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            title: Text(
              'Renseignez une pièce personnalisée',
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
                TextField(
                  controller: _textEditingController,
                  style: TextStyle(
                    fontSize: AppTheme.subtitle1Size,
                    color: AppTheme.blackColor,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Ex: Chambre 122',
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
                      print('Utiliser la pièce : $searchQuery');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SensorChooseRoomEquipmentPage(
                            title: searchQuery,
                            name: _pageTitle,
                          ),
                        ),
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
                    child: Text('Sélectionner'),
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
        appBar: ReturnAppBar(title: _pageTitle),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Container(
                height: 40,
                child: Center(
                  child: TextFormField(
                    obscureText: false,
                    onChanged: (value) {
                      // Mettre à jour le titre de la page lorsque le texte est modifié
                      setState(() {
                        _pageTitle = value.isNotEmpty ? value : "Titre initial";
                      });
                    },
                    style: TextStyle(
                      fontSize: AppTheme.headline6Size,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Renommer le capteur',
                      hintStyle: TextStyle(
                        fontSize: AppTheme.headline6Size,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.grayColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                child: Text(
                  "CHOIX DE LA PIÈCE",
                  style: TextStyle(
                    fontSize: AppTheme.subtitle1Size,
                    color: AppTheme.grayColor,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  child: ListView.builder(
                    itemCount: sensorsList.length,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final sensorName = sensorsList[index];
                      final isLastItem = index == sensorsList.length - 1;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              if (isLastItem) {
                                // Logique spécifique pour le dernier élément
                                _customRoomAlertDialog();
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SensorChooseRoomEquipmentPage(
                                      title: sensorName,
                                      name: _pageTitle,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.78,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            sensorName,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (!isLastItem) Divider(),
                        ],
                      );
                    },
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
