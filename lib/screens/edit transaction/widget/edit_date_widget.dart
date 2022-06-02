import 'package:flutter/material.dart';
import 'package:xpense_app/screens/home%20screen/widgets/custom_icons.dart';

//DateTime selectedDate = DateTime.now();
DateTime editedDate = DateTime.now();

class EditDatepick extends StatefulWidget {
  EditDatepick({Key? key, required this.editdate}) : super(key: key);
  DateTime editdate;

  @override
  State<EditDatepick> createState() => _EditDatepickState();
}

class _EditDatepickState extends State<EditDatepick> {
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
    //print(editedDate);

    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: widget.editdate,
        firstDate: DateTime(2020, 12),
        lastDate: DateTime(2100, 01));

    if (picked != null && picked != widget.editdate) {
      setState(() {
        widget.editdate = picked;
        editedDate = widget.editdate;
        print(editedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    editedDate = widget.editdate;
    return Container(
      width: 320,
      height: 60,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
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
                            '${widget.editdate.day} ${month[widget.editdate.month - 1]}',
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
