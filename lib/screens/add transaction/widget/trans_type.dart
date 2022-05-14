import 'package:flutter/material.dart';

String type = 'Income';

class TransType extends StatefulWidget {
  const TransType({Key? key}) : super(key: key);

  @override
  State<TransType> createState() => _TransTypeState();
}

class _TransTypeState extends State<TransType> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: Text(
            'Income',
            style: TextStyle(
                color: type == 'Income' ? Colors.white : Colors.black),
          ),
          selected: type == 'Income' ? true : false,
          selectedColor: const Color.fromARGB(255, 139, 9, 204),
          labelStyle: const TextStyle(color: Colors.white),
          onSelected: (val) {
            FocusManager.instance.primaryFocus?.unfocus();
            if (val) {
              setState(() {
                type = 'Income';
              });
            }
          },
        ),
        const SizedBox(
          width: 20,
        ),
        ChoiceChip(
          label: Text(
            'Expense',
            style: TextStyle(
                color: type == 'Expense' ? Colors.white : Colors.black),
          ),
          selected: type == 'Expense' ? true : false,
          selectedColor: const Color.fromARGB(255, 139, 9, 204),
          labelStyle: const TextStyle(color: Colors.white),
          onSelected: (val) {
            FocusManager.instance.primaryFocus?.unfocus();
            if (val) {
              setState(() {
                type = 'Expense';
              });
            }
          },
        )
      ],
    );
  }
}
