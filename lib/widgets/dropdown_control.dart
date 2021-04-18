import 'package:flutter/material.dart';
import '../components/constants.dart';

class DropdownControl extends StatelessWidget {
  final String hintText;
  final String valueSetter;
  final List<DropdownMenuItem> items;
  final Function onChange;

  DropdownControl({this.hintText, this.valueSetter, this.items, this.onChange});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        hint: Text(hintText),
        dropdownColor: Colors.white,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36.0,
        isExpanded: true,
        underline: SizedBox(),
        style: kGradeDropdownStyle,
        value: valueSetter,
        items: items,
        onChanged: onChange);
  }
}
