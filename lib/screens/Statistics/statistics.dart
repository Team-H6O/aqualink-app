import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/Appbar/returnAppbar.dart';
import 'package:aqualink/widgets/Appbar/simpleAppbar.dart';
import 'package:aqualink/widgets/Statistics/linearGraph.dart';
import 'package:aqualink/screens/Statistics/sensorStatistics.dart';

class StatisticsPage extends StatefulWidget {
  final String title;
  const StatisticsPage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  List<String> filterItems = [
    'Euros',
    'Litres',
  ];

  int selectedIndex = 0;
  int touchedIndex = -1;
  int selectedButtonIndex = 0;
  double testValue = 0;

  List<PieChartSectionData> showingSections(List<Map<String, dynamic>> data) {
    return List.generate(data.length, (i) {
      final datum = data[i];
      final isSelected = i == touchedIndex;
      final isTouched =
          isSelected || (i == 0); // Highlight the first element by default
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 70.0 : 55.0;
      final widgetSize = isTouched ? 55.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: isSelected ? AppTheme.darkPrimaryColor : AppTheme.primaryColor,
        value: datum['weekValue'].toDouble(),
        title: isSelected
            ? '${datum['value']}%'
            : '', // Show percentage for selected element
        radius: radius,
        titleStyle: TextStyle(
          fontSize: 0,
          color: AppTheme.darkPrimaryColor,
        ),
        badgeWidget: _Badge(
          datum['iconPath'],
          size: widgetSize,
          borderColor: AppTheme.darkPrimaryColor,
        ),
        badgePositionPercentageOffset: .98,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Sample data for demonstration (replace this with your data)
    List<Map<String, dynamic>> pieChartData = [
      {
        'weekValue': 40.0,
        'monthValue': 160.0,
        'yearValue': 1.92,
        'iconPath': 'assets/image/room/bathroom.svg',
      },
      {
        'weekValue': 30.0,
        'monthValue': 120.0,
        'yearValue': 1.22,
        'iconPath': 'assets/image/room/toilet.svg',
      },
      {
        'weekValue': 16.0,
        'monthValue': 80.0,
        'yearValue': 0.82,
        'iconPath': 'assets/image/room/kitchen.svg',
      },
      {
        'weekValue': 15.0,
        'monthValue': 75.0,
        'yearValue': 0.72,
        'iconPath': 'assets/image/room/garden.svg',
      },
    ];

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

    // Fonction pour obtenir la valeur (value) sélectionnée du tableau pieChartData
    double getValueAtIndex(int index) {
      if (index >= 0 && index < pieChartData.length) {
        if (selectedButtonIndex == 0) {
          return pieChartData[index]['weekValue'];
        } else if (selectedButtonIndex == 1) {
          return pieChartData[index]['monthValue'];
        } else {
          return pieChartData[index]['yearValue'];
        }
      } else {
        return pieChartData[0]['weekValue'];
      }
    }

    void onSwitchButtonPressed(int index) {
      double selectedValue = getValueAtIndex(index);
      testValue = selectedValue;
      setState(() {
        selectedButtonIndex = index;
        print(selectedButtonIndex);
      });
    }

    // Utilisation de la fonction dans onPieChartItemSelected
    void onPieChartItemSelected(int index) {
      double selectedValue = getValueAtIndex(index);
      testValue = selectedValue;
      setState(() {
        touchedIndex = index;
        print(touchedIndex);
      });
    }

    return GestureDetector(
      child: Scaffold(
        backgroundColor: AppTheme.nearWhiteColor,
        appBar: SimpleAppBar(title: "Ma consommation"),
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
                                onPressed: () => onSwitchButtonPressed(0),
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
                                onPressed: () => onSwitchButtonPressed(1),
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
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => onSwitchButtonPressed(2),
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
                    Stack(
                      children: [
                        Center(
                          child: AspectRatio(
                            aspectRatio: 1.2,
                            child: PieChart(
                              PieChartData(
                                pieTouchData: PieTouchData(touchCallback:
                                    (FlTouchEvent event,
                                        PieTouchResponse? pieTouchResponse) {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    setState(() {
                                      touchedIndex = -1;
                                    });
                                  } else {
                                    int index = pieTouchResponse
                                        .touchedSection!.touchedSectionIndex;
                                    onPieChartItemSelected(
                                        index); // Appel de la fonction onPieChartItemSelected avec l'index de l'élément touché.
                                  }
                                }),
                                borderData: FlBorderData(show: false),
                                sectionsSpace: 4,
                                centerSpaceRadius: 60,
                                sections: showingSections(pieChartData),
                              ),
                            ),
                          ),
                        ),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.only(top: 135.0),
                          child: Text(
                              selectedButtonIndex == 2
                                  ? '$testValue m³'
                                  : '$testValue L',
                              style: TextStyle(
                                color: AppTheme.blackColor,
                                fontSize: AppTheme.headline4Size,
                                fontWeight: FontWeight.w800,
                              )),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(58, 110, 209, 206),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppTheme.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              color: AppTheme.validColor,
                              size: 22,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                  "Votre consommation a baissé par rapport à la semaine dernière"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Consommation par jour",
                      style: TextStyle(
                        fontSize: AppTheme.headline4Size,
                        fontWeight: FontWeight.w800,
                      ),
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
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: sensorData.map((data) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: GestureDetector(
                        onTap: () {
                          print(data['title']);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SensorStatistics(title: data['title']),
                            ),
                          );
                        },
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
                            padding: EdgeInsets.fromLTRB(15, 15, 5, 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Premiere row
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      data['iconPath'],
                                      width: 30,
                                    ),
                                    const SizedBox(
                                      width: 13,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data['title'],
                                          style: TextStyle(
                                            color: AppTheme.darkPrimaryColor,
                                            fontSize: AppTheme.headline6Size,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${data['weekValue']} € /',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize:
                                                    AppTheme.headline6Size,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              "cette semaine",
                                              style: TextStyle(
                                                color: AppTheme.grayColor,
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                // Deuxieme row
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "10%",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: AppTheme.headline3Size,
                                          ),
                                        ),
                                        Text("de la pièce"),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: AppTheme.darkPrimaryColor,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
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

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .20),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
        ),
      ),
    );
  }
}
