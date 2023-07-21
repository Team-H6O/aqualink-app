import 'package:flutter/material.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/Appbar/returnAppbar.dart';
import 'package:aqualink/screens/Parameters/MonitoringAlert/alert.dart';

class MonitoringAlertPage extends StatefulWidget {
  const MonitoringAlertPage({super.key});

  @override
  State<MonitoringAlertPage> createState() => _MonitoringAlertPageState();
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

class _MonitoringAlertPageState extends State<MonitoringAlertPage> {
  @override
  Widget build(BuildContext context) {
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

    List<Room> roomList = [
      Room(name: 'Cuisine', equipments: kitchenEquipments),
      Room(name: 'Salle de bain', equipments: bathroomEquipments),
    ];

    return GestureDetector(
      child: Scaffold(
        backgroundColor: AppTheme.nearWhiteColor,
        appBar: const ReturnAppBar(title: 'Gérer mes alertes'),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(40, 10, 20, 0),
                  child: Text(
                    room.name,
                    style: const TextStyle(
                      fontSize: AppTheme.subtitle1Size,
                      color: AppTheme.grayColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
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
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AlertPage(title: equipment.name),
                                        ),
                                      );
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.78,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    equipment.name,
                                                    style: const TextStyle(
                                                      fontSize: AppTheme
                                                          .headline6Size,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppTheme.blackColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Expanded(
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: AppTheme.grayColor,
                                              size: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (!isLastEquipment)
                                    const Divider(), // Ajouter le Divider ici
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
                  const SizedBox(
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
