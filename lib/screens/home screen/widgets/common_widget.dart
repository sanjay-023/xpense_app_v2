import 'package:flutter/material.dart';

commonSizedBox(double height) {
  return SizedBox(
    height: height,
  );
}

dateWidget(month, select) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: SizedBox(
      child: ChoiceChip(
        labelPadding: const EdgeInsets.symmetric(horizontal: 20),
        label: Text(
          month,
        ),
        labelStyle: const TextStyle(color: Colors.white),
        selected: select,
        selectedColor: const Color.fromARGB(255, 139, 9, 204),
        disabledColor: Color.fromARGB(255, 148, 148, 148),
      ),
    ),
  );
}
