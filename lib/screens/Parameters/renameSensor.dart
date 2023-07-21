import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/Appbar/returnAppbar.dart';
import 'package:aqualink/screens/Navigation/navigation.dart';

class RenameSensorPage extends StatefulWidget {
  const RenameSensorPage({super.key});

  @override
  State<RenameSensorPage> createState() => _RenameSensorPageState();
}

class Equipment {
  final String name;

  Equipment({required this.name});
}

// Modèle d'objet pour les pièces
class Room {
  final String name;
  List<Equipment> equipments;

  Room({required this.name, required this.equipments});
}

class _RenameSensorPageState extends State<RenameSensorPage> {
  TextEditingController _textEditingController = TextEditingController();

  // Définir la liste roomList comme une variable membre de la classe
  List<Room> roomList = [];

  @override
  void initState() {
    super.initState();

    // Initialiser la liste roomList dans le constructeur
    roomList = [
      Room(name: 'Cuisine', equipments: kitchenEquipments),
      Room(name: 'Salle de bain', equipments: bathroomEquipments),
    ];

    _selectedRoom = roomList.isNotEmpty ? roomList[0].name : '';
  }

  String _selectedRoom = '';
  // String _initialRoom = '';

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

  // Étape 1 : Fonction pour mettre à jour le nom de l'équipement
  void _updateEquipmentName(String newName, String roomName, String oldName) {
    setState(() {
      // Trouver la pièce avec le nom donné
      Room room = roomList.firstWhere((room) => room.name == roomName);

      // Trouver l'index de l'équipement dans la pièce avec le nom donné
      int equipmentIndex =
          room.equipments.indexWhere((eq) => eq.name == oldName);

      // Mettre à jour le nom de l'équipement en créant un nouvel objet Equipment
      room.equipments[equipmentIndex] = Equipment(name: newName);

      // print('newName => ' + newName);
      // print('roomName => ' + roomName);
      // print('oldName => ' + oldName);
      // print('_selectedRoom => ' + _selectedRoom);
      // print('_initialRoom => ' + _initialRoom);
      // _moveEquipmentToRoom(oldName, _initialRoom, _selectedRoom);
    });
  }

  void _renameSensorAlertDialog(String roomName, String sensorName) {
    _textEditingController.text = sensorName;
    // _initialRoom = roomName;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: AlertDialog(
                  title: Text(
                    'Renommez $sensorName',
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
                        // initialValue: "dsqqs",
                        style: TextStyle(
                          fontSize: AppTheme.subtitle1Size,
                          color: AppTheme.blackColor,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            padding: EdgeInsets.fromLTRB(15, 15, 0,
                                0), // Réduction du padding du bouton croix
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
                      SizedBox(
                        height: 5,
                      ),
                      // DropdownButton<String>(
                      //   style: TextStyle(
                      //       fontSize: AppTheme.subtitle1Size,
                      //       color: AppTheme.blackColor),
                      //   isExpanded: true,
                      //   underline: Container(
                      //     // Utilisez un Container personnalisé pour le bord inférieur
                      //     height: 1, // Définissez l'épaisseur du bord inférieur
                      //     color: const Color.fromARGB(255, 154, 147,
                      //         147), // Définissez la couleur du bord inférieur au clic
                      //   ),
                      //   value: _selectedRoom = roomName,
                      //   onChanged: (newValue) {
                      //     setState(() {
                      //       roomName =
                      //           newValue!; // Mettre à jour la pièce sélectionnée
                      //       // _isSelected = false;
                      //       // Navigator.of(context).pop();
                      //       // _renameSensorAlertDialog(roomName, sensorName);
                      //       print(sensorName +
                      //           '/' +
                      //           _selectedRoom +
                      //           '/' +
                      //           roomName);
                      //       // _moveEquipmentToRoom(
                      //       //     sensorName, _selectedRoom, roomName);
                      //     });
                      //   },
                      //   items:
                      //       roomList.map<DropdownMenuItem<String>>((Room room) {
                      //     return DropdownMenuItem<String>(
                      //       value: room.name,
                      //       child: Text(room.name),
                      //     );
                      //   }).toList(),
                      // ),
                    ],
                  ),
                  actions: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        child: ElevatedButton(
                          onPressed: () {
                            // Logique de recherche avec le numéro de série
                            String newName = _textEditingController.text;
                            // print(roomName);
                            _updateEquipmentName(newName, roomName, sensorName);
                            Navigator.of(context).pop();
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
                          child: Text('Enregistrer les modifications'),
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
        });
  }

  // FONCTION POUR CHANGER L'AQUALINK DE PIÈCE (À RÉSOUDRE)

  // void _moveEquipmentToRoom(
  //     String equipmentName, String sourceRoomName, String targetRoomName) {
  //   setState(() {
  //     // Trouver la pièce source avec le nom donné
  //     Room sourceRoom =
  //         roomList.firstWhere((room) => room.name == sourceRoomName);

  //     // Trouver la pièce cible avec le nom donné
  //     Room targetRoom =
  //         roomList.firstWhere((room) => room.name == targetRoomName);

  //     // Trouver l'équipement dans la pièce source avec le nom donné
  //     sourceRoom.equipments.removeWhere((eq) => eq.name == equipmentName);

  //     // Chercher l'équipement dans la pièce cible avec le même nom
  //     Equipment? existingEquipment = targetRoom.equipments
  //         .firstWhereOrNull((eq) => eq.name == equipmentName);

  //     if (existingEquipment == null) {
  //       // Ajouter l'équipement à la pièce cible uniquement s'il n'existe pas déjà dans la pièce cible
  //       targetRoom.equipments.add(Equipment(name: equipmentName));
  //     } else {
  //       // Si l'équipement existe déjà dans la pièce cible, incrémenter son nom
  //       int increment = 2; // Valeur de départ pour l'incrémentation
  //       String newName = "$equipmentName $increment";

  //       // Rechercher un nouveau nom incrémenté qui n'existe pas encore dans la pièce cible
  //       while (targetRoom.equipments.any((eq) => eq.name == newName)) {
  //         increment++;
  //         newName = "$equipmentName $increment";
  //       }

  //       // Ajouter l'équipement avec le nouveau nom dans la pièce cible
  //       targetRoom.equipments.add(Equipment(name: newName));
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: AppTheme.nearWhiteColor,
        appBar: ReturnAppBar(title: 'Renommer un Aqualink'),
        body: ListView.builder(
          itemCount: roomList.length,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, roomIndex) {
            Room room = roomList[roomIndex];
            final isLastRoom = roomIndex == roomList.length - 1;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 10, 20, 0),
                  child: Text(
                    room.name,
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
                              final isLastEquipment =
                                  equipmentIndex == room.equipments.length - 1;

                              return Column(
                                children: [
                                  Container(
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.76,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  equipment.name,
                                                  style: TextStyle(
                                                    fontSize:
                                                        AppTheme.headline6Size,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppTheme.blackColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: InkWell(
                                          onTap: () {
                                            _renameSensorAlertDialog(
                                                room.name, equipment.name);
                                          },
                                          child: Icon(
                                            Icons.edit,
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
            );
          },
        ),
      ),
    );
  }
}
