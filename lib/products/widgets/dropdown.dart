import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/constants/AppColor.dart';

class dropdown extends StatefulWidget {
  final String labelText;

  dropdown(this.labelText);
  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  String selectedValue = "USA";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return _drop();
  }

  Widget _drop() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.labelText,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: AppColors().white),
          ),
        ),
        SizedBox(height: context.dynamicHeight(0.01)),
        DropdownButtonFormField(
            decoration: InputDecoration(
              border: _outlineborder(context),
              filled: true,
              fillColor: AppColors().white,
            ),
            validator: (value) => value == null ? "Select a country" : null,
            dropdownColor: AppColors().white,
            value: selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue!;
              });
            },
            items: dropdownItems)
      ],
    );
  }

  OutlineInputBorder _outlineborder(BuildContext context) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: AppColors().white),
        borderRadius: context.highBorderRadius);
  }
}
