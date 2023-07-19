import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/returnAppbar.dart';

class SensorChooseRoomEquipmentPage extends StatefulWidget {
  final String title;
  final String name;

  const SensorChooseRoomEquipmentPage(
      {Key? key, required this.title, required this.name})
      : super(key: key);

  @override
  State<SensorChooseRoomEquipmentPage> createState() =>
      _SensorChooseRoomEquipmentPageState();
}

class _SensorChooseRoomEquipmentPageState
    extends State<SensorChooseRoomEquipmentPage> {
  final List<String> equipmentList = [
    'Toilette',
    'Lave-vaisselle',
    'Lave-linge',
    'Robinet',
    'Douche',
    'Bain',
    "Tuyau d'arrosage",
    'Piscine',
    'Équipement personnalisé'
  ];

  TextEditingController _textEditingController = TextEditingController();

  void _addNewSensorAlertDialog(String sensorName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            title: Text(
              "Le capteur ${widget.name} de l'équipement $sensorName va être ajouté à la pièce ${widget.title}.",
              style: TextStyle(
                fontSize: AppTheme.bodyText1Size,
                fontWeight: FontWeight.w600,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => SensorChooseRoomEquipmentPage(
                      //       title: searchQuery,
                      //     ),
                      //   ),
                      // );
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
                    child: Text('Ajouter'),
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

  void _customEquipmentAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            title: Text(
              'Renseignez un équipement personnalisée',
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
                    hintText: 'Ex: Arroseur automatique',
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
                      Navigator.of(context).pop();
                      _addNewSensorAlertDialog(searchQuery);
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
        appBar: ReturnAppBar(title: 'Pièce : ${widget.title}'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(40, 10, 20, 0),
              child: Text(
                "CHOIX DE L'ÉQUIPEMENT",
                style: TextStyle(
                  fontSize: AppTheme.subtitle1Size,
                  color: AppTheme.grayColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  child: ListView.builder(
                    itemCount: equipmentList.length,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final sensorName = equipmentList[index];
                      final isLastItem = index == equipmentList.length - 1;

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              if (isLastItem) {
                                // Logique spécifique pour le dernier élément
                                _customEquipmentAlertDialog();
                              } else {
                                // Logique générale pour les autres éléments
                                _addNewSensorAlertDialog(sensorName);
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
                                  Visibility(
                                    visible: isLastItem,
                                    child: Expanded(
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}
