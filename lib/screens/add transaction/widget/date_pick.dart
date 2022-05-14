import 'package:flutter/material.dart';
import 'package:xpense_app/screens/home%20screen/widgets/custom_icons.dart';

DateTime selectedDate = DateTime.now();

class Datepick extends StatefulWidget {
  Datepick({Key? key}) : super(key: key);

  @override
  State<Datepick> createState() => _DatepickState();
}

class _DatepickState extends State<Datepick> {
  List<String> month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  Future<void> _selectdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 12),
        lastDate: DateTime(2100, 01));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 60,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 227, 225, 225),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 139, 9, 204),
              child: Icon(
                MyFlutterApp.calender,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                  width: 210,
                  height: 60,
                  child: TextButton(
                      onPressed: () {
                        _selectdate(context);
                      },
                      child: Row(
                        children: [
                          Text(
                            '${selectedDate.day} ${month[selectedDate.month - 1]}',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 99, 99, 99),
                                fontSize: 17),
                          ),
                        ],
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
