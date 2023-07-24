import 'package:flutter/material.dart';
import 'package:aqualink/widgets/Statistics/linearGraph.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/Appbar/returnAppbar.dart';

class SensorStatistics extends StatefulWidget {
  final String title;

  const SensorStatistics({Key? key, required this.title}) : super(key: key);

  @override
  State<SensorStatistics> createState() => _SensorStatisticsState();
}

class _SensorStatisticsState extends State<SensorStatistics> {
  List<String> filterItems = [
    'Euros',
    'Litres',
  ];

  int selectedIndex = 0;
  int touchedIndex = -1;
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sensorData = [
      {
        'title': 'Lavabo',
        'dayValue': 0.25,
        'weekValue': 8.25,
        'monthValue': 250.75,
        'yearValue': 10275.25,
        'iconPath': 'assets/image/object/sink.svg',
      },
      {
        'title': 'Douche',
        'dayValue': 0.25,
        'weekValue': 8.25,
        'monthValue': 250.75,
        'yearValue': 10275.25,
        'iconPath': 'assets/image/object/shower.svg',
      },
      {
        'title': 'Toilettes',
        'dayValue': 0.25,
        'weekValue': 8.25,
        'monthValue': 250.75,
        'yearValue': 10275.25,
        'iconPath': 'assets/image/object/toilet.svg',
      },
      {
        'title': 'Machine à laver',
        'dayValue': 0.25,
        'weekValue': 8.25,
        'monthValue': 250.75,
        'yearValue': 10275.25,
        'iconPath': 'assets/image/object/washing.svg',
      },
    ];

    List<Map<String, dynamic>> advices = [
      {
        'priority': 1,
        'title': 'Est-il possible de suivre ma consommation en temps réel ?',
        'description':
            'Les compteurs Aqualink, ne permettent qu’un suivi avec un jour de décalage.',
      },
      {
        'priority': 1,
        'title': 'Comment sont utilisées mes données de consommation ?',
        'description':
            'Nous nous sommes engagés à ne pas diffuser ni vendre vos données personnelles. Et puis de toute façon, on n’en a pas envie !',
      },
    ];

    return GestureDetector(
      child: Scaffold(
        backgroundColor: AppTheme.nearWhiteColor,
        appBar: ReturnAppBar(title: widget.title),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkResponse(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: selectedIndex == 0
                                  ? AppTheme.darkPrimaryColor
                                  : AppTheme.lightGrayColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.euro,
                              color: selectedIndex == 0
                                  ? AppTheme.darkPrimaryColor
                                  : AppTheme.lightGrayColor,
                              size: 16,
                            ),
                            SizedBox(width: 8),
                            Text(
                              filterItems[0],
                              style: TextStyle(
                                color: selectedIndex == 0
                                    ? AppTheme.darkPrimaryColor
                                    : AppTheme.lightGrayColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkResponse(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: selectedIndex == 1
                                  ? AppTheme.darkPrimaryColor
                                  : AppTheme.lightGrayColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.opacity,
                              color: selectedIndex == 1
                                  ? AppTheme.darkPrimaryColor
                                  : AppTheme.lightGrayColor,
                              size: 16,
                            ),
                            SizedBox(width: 8),
                            Text(
                              filterItems[1],
                              style: TextStyle(
                                color: selectedIndex == 1
                                    ? AppTheme.darkPrimaryColor
                                    : AppTheme.lightGrayColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 195, 224, 223)
                                .withOpacity(0.5), // Couleur de l'ombre
                            spreadRadius: 2.0, // Rayon de diffusion de l'ombre
                            blurRadius: 5.0, // Rayon de flou de l'ombre
                            offset: Offset(0,
                                3), // Décalage de l'ombre (horizontal, vertical)
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 30,
                      child: Padding(
                        padding: EdgeInsets.all(3),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButtonIndex = 0;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: selectedButtonIndex == 0
                                      ? AppTheme.darkPrimaryColor
                                      : AppTheme.whiteColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                                child: Text(
                                  'S',
                                  style: TextStyle(
                                    color: selectedButtonIndex == 0
                                        ? AppTheme.whiteColor
                                        : AppTheme.darkPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButtonIndex = 1;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: selectedButtonIndex == 1
                                      ? AppTheme.darkPrimaryColor
                                      : AppTheme.whiteColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                                child: Text(
                                  'M',
                                  style: TextStyle(
                                    color: selectedButtonIndex == 1
                                        ? AppTheme.whiteColor
                                        : AppTheme.darkPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            // VerticalDivider(
                            //   color: Colors.grey,
                            //   thickness: 1.0,
                            //   width: 1.0,
                            //   indent: 8.0,
                            //   endIndent: 8.0,
                            // ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButtonIndex = 2;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: selectedButtonIndex == 2
                                      ? AppTheme.darkPrimaryColor
                                      : AppTheme.whiteColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                                child: Text(
                                  'A',
                                  style: TextStyle(
                                    color: selectedButtonIndex == 2
                                        ? AppTheme.whiteColor
                                        : AppTheme.darkPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TOTAL",
                              style: TextStyle(
                                color: AppTheme.darkPrimaryColor,
                                fontSize: AppTheme.headline6Size,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "14,08 L",
                                  style: TextStyle(
                                    color: AppTheme.blackColor,
                                    fontSize: AppTheme.headline2Size,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
                                  child: Text(
                                    "d'eau",
                                    style: TextStyle(
                                      color: AppTheme.blackColor,
                                      fontSize: AppTheme.bodyText1Size,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "cette semaine",
                              style: TextStyle(
                                color: AppTheme.blackColor,
                                fontSize: AppTheme.bodyText1Size,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "+10 L",
                              style: TextStyle(
                                color: AppTheme.validColor,
                                fontSize: AppTheme.headline4Size,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.trending_down,
                              color: AppTheme.validColor,
                              size: 22,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 195, 224, 223)
                            .withOpacity(0.5), // Couleur de l'ombre
                        spreadRadius: 2.0, // Rayon de diffusion de l'ombre
                        blurRadius: 5.0, // Rayon de flou de l'ombre
                        offset: Offset(
                            0, 3), // Décalage de l'ombre (horizontal, vertical)
                      ),
                    ],
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const LineChartSample2(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Text(
                  "Les améliorations possibles",
                  style: TextStyle(
                    fontSize: AppTheme.headline4Size,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: advices.map((data) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 195, 224, 223)
                                  .withOpacity(0.5),
                              spreadRadius: 2.0,
                              blurRadius: 5.0,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: Column(
                            children: [
                              Text(
                                data['title'],
                                style: TextStyle(
                                  color: AppTheme.darkPrimaryColor,
                                  fontSize: AppTheme.headline6Size,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(data['description']),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
