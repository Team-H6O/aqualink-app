import 'package:aqualink/utils/theme.dart';
import 'package:flutter/material.dart';

class HorizontalFilter extends StatefulWidget {
  @override
  _HorizontalFilterState createState() => _HorizontalFilterState();
}

class _HorizontalFilterState extends State<HorizontalFilter> {
  List<String> filterItems = [
    'Tous',
    'Filtre 1',
    'Filtre 2',
    'Filtre 3',
    'Filtre 4',
    'Filtre 5',
    'Filtre 6',
    'Filtre 7',
    'Filtre 8',
    'Filtre 9',
  ];

  int selectedFilterIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedFilterIndex = 0;
                  });
                },
                child: FixedFilterItem(
                  text: filterItems[0],
                  isSelected: selectedFilterIndex == 0,
                ),
              ),
            ),
            VerticalDivider(
              color: Colors.grey,
              thickness: 1.0,
              width: 1.0,
              indent: 8.0,
              endIndent: 8.0,
            ),
            Row(
              children: List.generate(filterItems.length - 1, (index) {
                final filterIndex = index + 1;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilterIndex = filterIndex;
                      });
                    },
                    child: FilterItem(
                      text: filterItems[filterIndex],
                      isSelected: selectedFilterIndex == filterIndex,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const FilterItem({Key? key, required this.text, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3,
            color: isSelected ? AppTheme.darkPrimaryColor : Colors.transparent,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppTheme.blackColor,
          fontSize: AppTheme.headline6Size,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class FixedFilterItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const FixedFilterItem({Key? key, required this.text, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3,
            color: isSelected ? AppTheme.darkPrimaryColor : Colors.transparent,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppTheme.blackColor,
          fontSize: AppTheme.headline6Size,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
