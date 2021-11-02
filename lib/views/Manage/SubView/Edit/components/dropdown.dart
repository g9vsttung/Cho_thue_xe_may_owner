// ignore_for_file: avoid_function_literals_in_foreach_calls, must_be_immutable

import 'package:flutter/material.dart';

class DropDownStatus extends StatefulWidget {
  String dropDownValue;
  Function(String selected) onChanged;
  DropDownStatus(
      {Key? key, required this.onChanged, required this.dropDownValue})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DropDownStatus();
  }
}

class _DropDownStatus extends State<DropDownStatus> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    BikeStatus a = BikeStatus("0", true);
    BikeStatus b = BikeStatus("1", false);
    List<BikeStatus> listItem = [a, b];

    if (widget.dropDownValue == "") {
      widget.dropDownValue = listItem[0].key;
    }
    return Container(
      width: size.width * 0.4,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: DropdownButton(
          underline: const SizedBox(),
          value: widget.dropDownValue,
          onChanged: (value) {
            widget.onChanged(value.toString());
          },
          iconSize: 12,
          icon: Image.asset(
            "assets/icons/dropDown.png",
            color: Colors.black,
            width: 14,
          ),
          items: listItem.map((BikeStatus t) {
            String value = "";
            if (t.value)
              value = "Hoạt động";
            else
              value = "Tạm ngưng";
            return DropdownMenuItem(
              value: t.key,
              child: SizedBox(
                width: size.width * 0.4 - 20,
                child: Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList()),
    );
  }
}

class BikeStatus {
  String key;
  bool value;
  BikeStatus(this.key, this.value);
}
