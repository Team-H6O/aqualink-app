import 'package:flutter/material.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/screens/Statistics/sensorStatistics.dart';
import 'package:aqualink/screens/Statistics/statistics.dart';
import 'package:aqualink/widgets/Appbar/customAppbar.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Home'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class Equipment {
  final String name;
  final double value;
  final int alert;
  final String asset;

  Equipment(
      {required this.name,
      required this.value,
      required this.alert,
      required this.asset});
}

// Modèle d'objet pour les pièces
class Room {
  final String name;
  final double lastValue;
  final List<Equipment> equipments;
  final String asset;

  Room(
      {required this.name,
      required this.lastValue,
      required this.equipments,
      required this.asset});
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Equipment> kitchenEquipments = [
      Equipment(
          name: 'Lave-vaisselle',
          value: 7.4,
          alert: 0,
          asset: 'assets/image/object/washing.png'),
      Equipment(
          name: 'Lavabo',
          value: 9.3,
          alert: 0,
          asset: 'assets/image/object/sink.png'),
    ];

    List<Equipment> bathroomEquipments = [
      Equipment(
          name: 'Douche',
          value: 15.4,
          alert: 0,
          asset: 'assets/image/object/shower.png'),
      Equipment(
          name: 'Lave-linge',
          value: 7.7,
          alert: 0,
          asset: 'assets/image/object/washing.png'),
      Equipment(
          name: 'Lavabo',
          value: 5.2,
          alert: 1,
          asset: 'assets/image/object/sink.png'),
      Equipment(
          name: 'Toilette',
          value: 6.1,
          alert: 2,
          asset: 'assets/image/object/toilet.png'),
    ];

    List<Room> roomList = [
      Room(
          name: 'Cuisine',
          lastValue: 20.1,
          equipments: kitchenEquipments,
          asset: 'assets/image/room/kitchen.png'),
      Room(
          name: 'Salle de bain',
          lastValue: 32.5,
          equipments: bathroomEquipments,
          asset: 'assets/image/room/bathroom.png'),
    ];

    // Fonction pour calculer la consommation par pièce
    double calculateTotalValue(List<Equipment> equipments) {
      double totalValue = 0.0;
      for (var equipment in equipments) {
        totalValue += equipment.value;
      }
      return totalValue;
    }

    // Fonction pour calculer la consommation de l'ensemble des pièces
    double calculateTotalValueForAllRooms(List<Room> rooms) {
      double totalValue = 0;
      for (var room in rooms) {
        totalValue += calculateTotalValue(room.equipments);
      }
      return totalValue;
    }

    // Fonction pour vérifier si la consommation d'une pièce est supérieur ou inferieure à la consommation précédente
    bool isTotalValueGreaterThanInitial(
        double totalValue, double initialValue) {
      return totalValue > initialValue;
    }

    // Afficher un signe + ou - en fonction de isTotalValueGreaterThanInitial()
    String getSign(double totalValue, double initialValue) {
      return isTotalValueGreaterThanInitial(totalValue, initialValue)
          ? "+"
          : "-";
    }

    String differencePercentage(double totalValue, double initialValue) {
      double differencePercentage = ((totalValue / initialValue) - 1) * 100;
      if(differencePercentage > 0) {
        String formattedDifference = '+ ${differencePercentage.toStringAsFixed(1)} %';
        return formattedDifference;
      }
      else {
        double removeMinus = differencePercentage * (-1);
        String formattedDifference = '- ${removeMinus.toStringAsFixed(1)} %';
        return formattedDifference;
      }
    }

    double totalValueForAllRooms = calculateTotalValueForAllRooms(roomList);
    double euroPerLiter = totalValueForAllRooms * 0.004;

    // Liste des mois (FR)
    List<String> monthsList = [
      'Janvier',
      'Février',
      'Mars',
      'Avril',
      'Mai',
      'Juin',
      'Juillet',
      'Août',
      'Septembre',
      'Octobre',
      'Novembre',
      'Décembre',
    ];

    // Mois courant
    int currentMonthInt = new DateTime.now().month;
    String currentMonth = monthsList[currentMonthInt - 1];

    // Année courante
    int currentYearInt = new DateTime.now().year;
    String currentYear = currentYearInt.toString();

    // Date Mois/Année String
    String currentMonthYear = '$currentMonth $currentYear';

    return GestureDetector(
      child: Scaffold(
        backgroundColor: AppTheme.nearWhiteColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: MyAppBar(),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
              20, 0, 20, 0), // Ajoute un padding pour éviter le débordement
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Text(
                  'Ma consommation',
                  style: TextStyle(
                    fontSize: AppTheme.headline1Size,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                child: Text(
                  'Mes statistiques',
                  style: TextStyle(
                    fontSize: AppTheme.headline4Size,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Generated code for this Row Widget...
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.435,
                      decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Icon(
                                    Icons.invert_colors,
                                    color: AppTheme.darkPrimaryColor,
                                    size: 30,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ma conso d\'eau',
                                          style: TextStyle(
                                            fontSize: AppTheme.headline6Size,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          currentMonthYear,
                                          style: TextStyle(
                                            fontSize: AppTheme.bodyText1Size,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        totalValueForAllRooms.toStringAsFixed(1),
                                        style: TextStyle(
                                          fontSize: AppTheme.headline3Size,
                                          fontWeight: FontWeight.w900,
                                          color: AppTheme.darkPrimaryColor,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Text(
                                          'litres',
                                          style: TextStyle(
                                            fontSize: AppTheme.headline4Size,
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.darkPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: AppTheme.darkPrimaryColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.435,
                      decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(7, 7, 7, 7),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 0),
                                  child: Icon(
                                    Icons.euro,
                                    color: AppTheme.darkPrimaryColor,
                                    size: 30,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ma conso',
                                          style: TextStyle(
                                            fontSize: AppTheme.headline6Size,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          currentMonthYear,
                                          style: TextStyle(
                                            fontSize: AppTheme.bodyText1Size,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        euroPerLiter.toStringAsFixed(3),
                                        style: TextStyle(
                                          fontSize: AppTheme.headline3Size,
                                          fontWeight: FontWeight.w900,
                                          color: AppTheme.darkPrimaryColor,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Text(
                                          'euros',
                                          style: TextStyle(
                                            fontSize: AppTheme.headline4Size,
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.darkPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: AppTheme.darkPrimaryColor,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 10, 12, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Evolution de ma consommation d\'eau',
                              style: TextStyle(
                                fontSize: AppTheme.headline6Size,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      '- 4.1%',
                                      style: TextStyle(
                                        fontSize: AppTheme.headline3Size,
                                        fontWeight: FontWeight.w900,
                                        color: AppTheme.validColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Icon(
                                        Icons.trending_down,
                                        color: AppTheme.validColor,
                                        size: 22,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          7, 0, 0, 0),
                                      child: Text(
                                        'par rapport au mois dernier',
                                        style: TextStyle(
                                          fontSize: AppTheme.subtitle1Size,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Par pièces',
                style: TextStyle(
                  fontSize: AppTheme.headline4Size,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Afficher les blocs d'équipements par pièce
              for (var room in roomList)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StatisticsPage(title: "Ma consommation"),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Container(
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                              color: AppTheme.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 8, 6, 8),
                              child: Column(
                                children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                     Container(
                                        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: isTotalValueGreaterThanInitial(
                                                              calculateTotalValue(room
                                                                  .equipments),
                                                              room.lastValue)
                                                          ? AppTheme
                                                              .errorColor
                                                          : AppTheme
                                                              .validColor,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(50), // Pour rendre le container arrondi
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              differencePercentage(calculateTotalValue(room.equipments), room.lastValue), 
                                              style: TextStyle(
                                                color: isTotalValueGreaterThanInitial(
                                                              calculateTotalValue(room
                                                                  .equipments),
                                                              room.lastValue)
                                                          ? AppTheme
                                                              .errorColor
                                                          : AppTheme
                                                              .validColor,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),  
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      room.asset,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  13, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                room.name,
                                                style: TextStyle(
                                                  fontSize:
                                                      AppTheme.headline4Size,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                '${room.equipments.length} appareils',
                                                style: TextStyle(
                                                  fontSize:
                                                      AppTheme.headline6Size,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppTheme.grayColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  25, 0, 25, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: Text(                                                      calculateTotalValue(room.equipments).toStringAsFixed(1),
                                                      style: TextStyle(
                                                        fontSize: AppTheme
                                                            .headline3Size,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: AppTheme.blackColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'litres/jour',
                                                style: TextStyle(
                                                  fontSize:
                                                      AppTheme.headline6Size,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 60,
                                  // ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: AppTheme.darkPrimaryColor,
                                    size: 26,
                                  ),
                                ],
                              ),
                                ],
                              )
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: _buildEquipmentRows(room.equipments),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),

              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                child: Text(
                  'Mes points clés',
                  style: TextStyle(
                    fontSize: AppTheme.headline4Size,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 15, 5, 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/image/object/globe.png',
                                width: 30,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      13, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Une contribution pour la planète',
                                        style: TextStyle(
                                          fontSize: AppTheme.headline6Size,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.darkPrimaryColor,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Vos efforts vous ont permis de réduire votre consommation d’eau de x% par rapport au mois dernier.',
                                          style: TextStyle(
                                            fontSize: AppTheme.subtitle1Size,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 15, 5, 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/image/object/euro.png',
                                width: 30,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      13, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Attention à votre consommation',
                                        style: TextStyle(
                                          fontSize: AppTheme.headline6Size,
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.darkPrimaryColor,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Text(
                                          'Essayez de vous donner pour objectif de moins utiliser d’eau lors de votre toilette. Préférez prendre des douches à des bains.',
                                          style: TextStyle(
                                            fontSize: AppTheme.subtitle1Size,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }

// Méthode pour générer les lignes de blocs d'équipements
  List<Widget> _buildEquipmentRows(List<Equipment> equipments) {
    List<Widget> equipmentRows = [];
    for (int i = 0; i < equipments.length; i += 2) {
      var equipment1 = equipments[i];
      var equipment2 = i + 1 < equipments.length ? equipments[i + 1] : null;

      equipmentRows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildEquipmentBlock(equipment1),
            if (equipment2 != null) _buildEquipmentBlock(equipment2),
          ],
        ),
      );

      // Ajouter un SizedBox entre les lignes si nécessaire (sauf pour la dernière ligne)
      if (i + 2 < equipments.length) {
        equipmentRows.add(SizedBox(
            height: 16)); // Vous pouvez ajuster la hauteur selon vos besoins
      }
    }

    return equipmentRows;
  }

  // Méthode pour générer un bloc d'équipement
  Widget _buildEquipmentBlock(Equipment equipment) {
    Color buttonColor = AppTheme.secondaryColor;

    if (equipment.alert == 1) {
      buttonColor = AppTheme.secondaryColor;
    } else if (equipment.alert == 2) {
      buttonColor = AppTheme.errorColor;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SensorStatistics(title: equipment.name),
          ),
        );
      },
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 5, 5, 5),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    equipment.asset,
                    width: 28,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 104,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppTheme.whiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            equipment.name,
                            style: TextStyle(
                              fontSize: AppTheme.bodyText1Size,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (equipment.alert == 0)
                Icon(
                  Icons.chevron_right,
                  color: AppTheme.darkPrimaryColor,
                  size: 20,
                ),
              if (equipment.alert == 1 || equipment.alert == 2)
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: buttonColor,
                      size: 18,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                      child: Icon(
                        Icons.chevron_right,
                        color: AppTheme.darkPrimaryColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
