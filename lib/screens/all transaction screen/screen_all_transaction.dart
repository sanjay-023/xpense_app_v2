import 'package:flutter/material.dart';
import 'package:xpense_app/db/function/db_helper.dart';
import 'package:xpense_app/db/model/transaction_model.dart';
import 'package:xpense_app/screens/all%20transaction%20screen/widgets/all_trans_widget.dart';
import 'package:xpense_app/screens/home%20screen/dash_screen.dart';
import 'package:xpense_app/screens/home%20screen/widgets/common_widget.dart';

String datFilterValue = 'All';
String yearFilterValue = 'Jan';

class ScreenAllTransaction extends StatefulWidget {
  const ScreenAllTransaction({Key? key}) : super(key: key);

  @override
  State<ScreenAllTransaction> createState() => _ScreenAllTransactionState();
}

class _ScreenAllTransactionState extends State<ScreenAllTransaction> {
  final items = <String>['All', 'Income', 'Expense'];
  final itemsDatFilter = <String>[
    'All',
    'Today',
    'Yesterday',
    'This Month',
    'This Year'
  ];

  final itemsYearFilter = <String>[
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
    'Dec'
  ];

  DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
          return const ScreenDash();
        }));
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (ctx) {
                    return const ScreenDash();
                  }));
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            title: const Text(
              'All Transactions',
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: SizedBox(
              child: ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // FIRST DROPDOWN
                        Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 139, 9, 204),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: DropdownButton<String>(
                                iconEnabledColor: Colors.white,
                                dropdownColor:
                                    const Color.fromARGB(255, 139, 9, 204),
                                style: const TextStyle(color: Colors.white),
                                underline: const Text(''),
                                borderRadius: BorderRadius.circular(10),
                                items: items.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: Text(value));
                                }).toList(),
                                value: dropDownValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropDownValue = newValue!;
                                  });
                                }),
                          ),
                        ),

                        //SECOND DROPDOWN
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 110,
                          height: 35,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 139, 9, 204),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: DropdownButton<String>(
                                iconEnabledColor: Colors.white,
                                dropdownColor:
                                    const Color.fromARGB(255, 139, 9, 204),
                                style: const TextStyle(color: Colors.white),
                                underline: const Text(''),
                                borderRadius: BorderRadius.circular(10),
                                items: itemsDatFilter
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: Text(value));
                                }).toList(),
                                value: datFilterValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    datFilterValue = newValue!;
                                  });
                                }),
                          ),
                        ),

                        //YEAR FILTER DROPDOWN

                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 110,
                          height: 35,
                          decoration: BoxDecoration(
                              color: datFilterValue == 'This Year'
                                  ? const Color.fromARGB(255, 139, 9, 204)
                                  : const Color.fromARGB(255, 198, 196, 196),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: DropdownButton<String>(
                                disabledHint: const Text('Month'),
                                menuMaxHeight: 200,
                                iconEnabledColor: Colors.white,
                                dropdownColor:
                                    const Color.fromARGB(255, 139, 9, 204),
                                style: const TextStyle(color: Colors.white),
                                underline: const Text(''),
                                borderRadius: BorderRadius.circular(10),
                                items: datFilterValue == 'This Year'
                                    ? itemsYearFilter
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                        return DropdownMenuItem<String>(
                                            value: value, child: Text(value));
                                      }).toList()
                                    : null,
                                value: yearFilterValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    yearFilterValue = newValue!;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  commonSizedBox(20),
                  FutureBuilder<List<TransactionModel>>(
                      future: dbHelper.fetch(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Unexpected error');
                        }
                        if (snapshot.hasData) {
                          if (snapshot.data!.isEmpty) {
                            return const Center(child: Text('No values found'));
                          }
                        }

                        if (snapshot.data == null) {
                          return const Text('Unexpected error');
                        }
                        return Column(
                          children: [
                            AllTransWidget(data: snapshot.data!),
                            commonSizedBox(90)
                          ],
                        );
                      })
                ],
              ),
            ),
          )),
    );
  }
}
