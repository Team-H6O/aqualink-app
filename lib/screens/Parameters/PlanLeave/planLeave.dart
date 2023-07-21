import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/widgets/Appbar/returnAppbar.dart';

class PlanLeavePage extends StatefulWidget {
  const PlanLeavePage({Key, key}) : super(key: key);

  @override
  State<PlanLeavePage> createState() => _PlanLeavePageState();
}

class _PlanLeavePageState extends State<PlanLeavePage> {
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Theme(
            data: Theme.of(context).copyWith(
              dialogTheme: DialogTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      16.0), // this is the border radius of the picker
                ),
              ),
              colorScheme: const ColorScheme.light(
                primary: AppTheme.darkPrimaryColor, // header background color
                onPrimary: AppTheme.whiteColor, // header text color
                onSurface: AppTheme.darkPrimaryColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor:
                      AppTheme.darkPrimaryColor, // button text color
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    );

    if (picked != null) {
      setState(() {
        _startDate = picked;
        if (_endDate != null && _startDate!.isAfter(_endDate!)) {
          _endDate = _startDate;
        }
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Theme(
            data: Theme.of(context).copyWith(
              dialogTheme: DialogTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      16.0), // this is the border radius of the picker
                ),
              ),
              colorScheme: const ColorScheme.light(
                primary: AppTheme.darkPrimaryColor, // header background color
                onPrimary: AppTheme.whiteColor, // header text color
                onSurface: AppTheme.darkPrimaryColor, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor:
                      AppTheme.darkPrimaryColor, // button text color
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    );

    if (picked != null) {
      setState(() {
        _endDate = picked;
        if (_startDate != null && _endDate!.isBefore(_startDate!)) {
          _startDate = _endDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: AppTheme.nearWhiteColor,
        appBar: const ReturnAppBar(title: 'Planifier une absence'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
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
                              child: const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Début à',
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
                                onPressed: () => _selectDate(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0.0,
                                  shadowColor: Colors.transparent,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                ),
                                child: _startDate != null
                                    ? Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}',
                                          style: const TextStyle(
                                            fontSize: AppTheme.headline6Size,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.darkPrimaryColor,
                                          ),
                                        ),
                                      )
                                    : const Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Sélectionner un jour',
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
                      const Divider(),
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
                              decoration: const BoxDecoration(),
                              child: const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Fin à',
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
                                onPressed: () => _selectEndDate(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0.0,
                                  shadowColor: Colors.transparent,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                ),
                                child: _endDate != null
                                    ? Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}',
                                          style: const TextStyle(
                                            fontSize: AppTheme.headline6Size,
                                            fontWeight: FontWeight.w400,
                                            color: AppTheme.darkPrimaryColor,
                                          ),
                                        ),
                                      )
                                    : const Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Sélectionner un jour',
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
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: AppTheme.darkPrimaryColor,
                  textStyle: const TextStyle(
                    fontSize: AppTheme.headline6Size,
                    fontWeight: FontWeight.w600,
                  ),
                  elevation: 2,
                  side: const BorderSide(color: Color(0x00FFFFFF)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text('Confirmer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
