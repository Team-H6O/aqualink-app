import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/returnAppbar.dart';
import 'package:numberpicker/numberpicker.dart';

class AlertPage extends StatefulWidget {
  final String title;

  const AlertPage({Key? key, required this.title}) : super(key: key);

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  bool _switchValueAll = false;

  bool _switchValueDay = false;
  bool _switchValueWeek = false;
  bool _switchValueMonth = false;

  int _selectedLiterDay = 0;
  int _selectedLiterWeek = 0;
  int _selectedLiterMonth = 0;

  void _openLiterDayPicker() {
    showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            title: Text(
              "Sélectionner un seuil en litre",
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            content: StatefulBuilder(builder: (context, SBsetState) {
              return NumberPicker(
                  selectedTextStyle:
                      TextStyle(color: AppTheme.darkPrimaryColor, fontSize: 35),
                  value: _selectedLiterDay,
                  minValue: 0,
                  maxValue: 100,
                  onChanged: (value) {
                    setState(() => _selectedLiterDay =
                        value); // to change on widget level state
                    SBsetState(() => _selectedLiterDay =
                        value); //* to change on dialog state
                  });
            }),
            actions: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {
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

  void _openLiterWeekPicker() {
    showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            title: Text(
              "Sélectionner un seuil en litre",
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            content: StatefulBuilder(
              builder: (context, SBsetState) {
                return NumberPicker(
                    selectedTextStyle: TextStyle(
                        color: AppTheme.darkPrimaryColor, fontSize: 35),
                    value: _selectedLiterWeek,
                    minValue: 0,
                    maxValue: 100,
                    onChanged: (value) {
                      setState(() => _selectedLiterWeek =
                          value); // to change on widget level state
                      SBsetState(() => _selectedLiterWeek =
                          value); //* to change on dialog state
                    });
              },
            ),
            actions: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {
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

  void _openLiterMonthPicker() {
    showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            title: Text(
              "Sélectionner un seuil en litre",
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            content: StatefulBuilder(
              builder: (context, SBsetState) {
                return NumberPicker(
                    selectedTextStyle: TextStyle(
                        color: AppTheme.darkPrimaryColor, fontSize: 35),
                    value: _selectedLiterMonth,
                    minValue: 0,
                    maxValue: 100,
                    onChanged: (value) {
                      setState(() => _selectedLiterMonth =
                          value); // to change on widget level state
                      SBsetState(() => _selectedLiterMonth =
                          value); //* to change on dialog state
                    });
              },
            ),
            actions: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {
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
        appBar: ReturnAppBar(title: widget.title),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _switchValueAll
                      ? AppTheme.darkPrimaryColor
                      : AppTheme.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.68,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Recevoir des alertes',
                                      style: TextStyle(
                                        fontSize: AppTheme.headline6Size,
                                        fontWeight: FontWeight.w400,
                                        color: _switchValueAll
                                            ? AppTheme.whiteColor
                                            : AppTheme.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Transform.scale(
                                scale:
                                    1.3, // Taille personnalisée du bouton switch
                                child: Switch(
                                  value: _switchValueAll,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      _switchValueAll = newValue;
                                    });
                                  },
                                  activeColor: AppTheme
                                      .primaryColor, // Couleur personnalisée du bouton switch lorsque activé
                                  inactiveThumbColor: AppTheme
                                      .whiteColor, // Couleur personnalisée du bouton switch lorsque désactivé
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
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: _switchValueAll,
              child: Padding(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.68,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Journalière',
                                        style: TextStyle(
                                          fontSize: AppTheme.headline6Size,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Transform.scale(
                                  scale:
                                      1.3, // Taille personnalisée du bouton switch
                                  child: Switch(
                                    value: _switchValueDay,
                                    onChanged: (bool newValue) {
                                      setState(() {
                                        _switchValueDay = newValue;
                                      });
                                    },
                                    activeColor: AppTheme
                                        .primaryColor, // Couleur personnalisée du bouton switch lorsque activé
                                    inactiveThumbColor: AppTheme
                                        .whiteColor, // Couleur personnalisée du bouton switch lorsque désactivé
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "Seuil d'alerte",
                                        style: TextStyle(
                                          fontSize: AppTheme.headline6Size,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _openLiterDayPicker,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0.0,
                                    shadowColor: Colors.transparent,
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  ),
                                  child: _selectedLiterDay != 0
                                      ? Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '$_selectedLiterDay L',
                                            style: TextStyle(
                                              fontSize: AppTheme.headline6Size,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.darkPrimaryColor,
                                            ),
                                          ),
                                        )
                                      : const Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'Sélectionner un seuil',
                                            style: TextStyle(
                                              fontSize: AppTheme.headline6Size,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.grayColor,
                                            ),
                                          ),
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
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: _switchValueAll,
              child: Padding(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.68,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Hebdomadaires',
                                        style: TextStyle(
                                          fontSize: AppTheme.headline6Size,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Transform.scale(
                                  scale:
                                      1.3, // Taille personnalisée du bouton switch
                                  child: Switch(
                                    value: _switchValueWeek,
                                    onChanged: (bool newValue) {
                                      setState(() {
                                        _switchValueWeek = newValue;
                                      });
                                    },
                                    activeColor: AppTheme
                                        .primaryColor, // Couleur personnalisée du bouton switch lorsque activé
                                    inactiveThumbColor: AppTheme
                                        .whiteColor, // Couleur personnalisée du bouton switch lorsque désactivé
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "Seuil d'alerte",
                                        style: TextStyle(
                                          fontSize: AppTheme.headline6Size,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _openLiterWeekPicker,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0.0,
                                    shadowColor: Colors.transparent,
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  ),
                                  child: _selectedLiterWeek != 0
                                      ? Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '$_selectedLiterWeek L',
                                            style: TextStyle(
                                              fontSize: AppTheme.headline6Size,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.darkPrimaryColor,
                                            ),
                                          ),
                                        )
                                      : const Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'Sélectionner un seuil',
                                            style: TextStyle(
                                              fontSize: AppTheme.headline6Size,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.grayColor,
                                            ),
                                          ),
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
            ),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: _switchValueAll,
              child: Padding(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.68,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Mensuelles',
                                        style: TextStyle(
                                          fontSize: AppTheme.headline6Size,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Transform.scale(
                                  scale:
                                      1.3, // Taille personnalisée du bouton switch
                                  child: Switch(
                                    value: _switchValueMonth,
                                    onChanged: (bool newValue) {
                                      setState(() {
                                        _switchValueMonth = newValue;
                                      });
                                    },
                                    activeColor: AppTheme
                                        .primaryColor, // Couleur personnalisée du bouton switch lorsque activé
                                    inactiveThumbColor: AppTheme
                                        .whiteColor, // Couleur personnalisée du bouton switch lorsque désactivé
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "Seuil d'alerte",
                                        style: TextStyle(
                                          fontSize: AppTheme.headline6Size,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _openLiterMonthPicker,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0.0,
                                    shadowColor: Colors.transparent,
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  ),
                                  child: _selectedLiterMonth != 0
                                      ? Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            '$_selectedLiterMonth L',
                                            style: TextStyle(
                                              fontSize: AppTheme.headline6Size,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.darkPrimaryColor,
                                            ),
                                          ),
                                        )
                                      : const Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'Sélectionner un seuil',
                                            style: TextStyle(
                                              fontSize: AppTheme.headline6Size,
                                              fontWeight: FontWeight.w400,
                                              color: AppTheme.grayColor,
                                            ),
                                          ),
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
            ),
          ],
        ),
      ),
    );
  }
}
