import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/Appbar/returnAppbar.dart';

class DeleteSensorPage extends StatefulWidget {
  const DeleteSensorPage({super.key});

  @override
  State<DeleteSensorPage> createState() => _DeleteSensorPageState();
}

class Equipment {
  final String name;

  Equipment({required this.name});
}

// Modèle d'objet pour les pièces
class Room {
  final String name;
  final List<Equipment> equipments;

  Room({required this.name, required this.equipments});
}

class _DeleteSensorPageState extends State<DeleteSensorPage> {
  List<Room> roomList = [];

  @override
  void initState() {
    super.initState();

    // Initialize the list roomList in the constructor
    roomList = [
      Room(name: 'Cuisine', equipments: kitchenEquipments),
      Room(name: 'Salle de bain', equipments: bathroomEquipments),
    ];
  }

  List<Equipment> kitchenEquipments = [
    Equipment(name: 'Lave-vaisselle'),
    Equipment(name: 'Lavabo'),
  ];

  List<Equipment> bathroomEquipments = [
    Equipment(name: 'Douche'),
    Equipment(name: 'Lave-linge'),
    Equipment(name: 'Lavabo'),
    Equipment(name: 'Toilette'),
  ];

  void _deleteEquipmentFromRoom(String equipmentName, String roomName) {
    setState(() {
      // Trouver la pièce avec le nom donné
      Room room = roomList.firstWhere((room) => room.name == roomName);

      // Supprimer l'équipement de la pièce avec le nom donné
      room.equipments.removeWhere((eq) => eq.name == equipmentName);
    });
  }

  void _deleteSensorAlertDialog(String roomName, String sensorName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            title: Text(
              "Le capteur $sensorName de la pièce $roomName va être supprimer. Cette opération sera irréversible.",
              style: const TextStyle(
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
                  width: MediaQuery.sizeOf(context).width * 0.55,
                  child: ElevatedButton(
                    onPressed: () {
                      _deleteEquipmentFromRoom(sensorName, roomName);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 35),
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor: AppTheme.errorColor,
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
                    child: Text('Supprimer $sensorName'),
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

  bool isRoomListEmpty(int length) {
    // Vérifiez si la liste de pièces (roomList) est vide
    return length == 0 ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: AppTheme.nearWhiteColor,
        appBar: ReturnAppBar(title: 'Supprimer un Aqualink'),
        body: isRoomListEmpty(roomList.length)
            ? Center(child: Text('Aucun capteur trouvé'))
            : ListView.builder(
                itemCount: roomList.length,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, roomIndex) {
                  Room room = roomList[roomIndex];
                  final isLastRoom = roomIndex == roomList.length - 1;
                  bool isRoomListEmpty(int length) {
                    // Vérifiez si la liste de pièces (roomList) est vide
                    return length == 0 ? false : true;
                  }

                  return Visibility(
                    visible:
                        isRoomListEmpty(roomList[roomIndex].equipments.length),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(40, 10, 20, 0),
                          child: Text(
                            room.name,
                            style: TextStyle(
                              fontSize: AppTheme.subtitle1Size,
                              color: AppTheme.grayColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 10, 20, 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListView.builder(
                                    itemCount: room.equipments.length,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, equipmentIndex) {
                                      Equipment equipment =
                                          room.equipments[equipmentIndex];
                                      final isLastEquipment = equipmentIndex ==
                                          room.equipments.length - 1;

                                      return Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 22,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.76,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          equipment.name,
                                                          style: TextStyle(
                                                            fontSize: AppTheme
                                                                .headline6Size,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppTheme
                                                                .blackColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                    child: InkWell(
                                                  onTap: () {
                                                    _deleteSensorAlertDialog(
                                                        room.name,
                                                        equipment.name);
                                                  },
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: AppTheme.grayColor,
                                                    size: 20,
                                                  ),
                                                )),
                                              ],
                                            ),
                                          ),
                                          if (!isLastEquipment)
                                            Divider(), // Ajouter le Divider ici
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (!isLastRoom)
                          SizedBox(
                            height: 22,
                          ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
