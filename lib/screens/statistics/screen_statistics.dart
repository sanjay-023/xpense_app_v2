import 'package:flutter/material.dart';
import 'package:xpense_app/db/function/db_helper.dart';
import 'package:xpense_app/screens/home%20screen/dash_screen.dart';
import 'package:xpense_app/screens/home%20screen/widgets/chart_widget.dart';
import 'package:xpense_app/screens/home%20screen/widgets/common_widget.dart';
import 'package:xpense_app/screens/statistics/widget/stat_filter.dart';

import '../../db/model/transaction_model.dart';

bool page = true;
String statDropDownValue = 'Income';

class ScreenStatistics extends StatefulWidget {
  const ScreenStatistics({Key? key}) : super(key: key);

  @override
  State<ScreenStatistics> createState() => _ScreenStatisticsState();
}

class _ScreenStatisticsState extends State<ScreenStatistics> {
  final items = <String>['Income', 'Expense'];
  @override
  Widget build(BuildContext context) {
    page = false;
    DbHelper dbHelper = DbHelper();
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
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 19,
                )),
            title: const Text('Statistics'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: SizedBox(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                value: statDropDownValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    statDropDownValue = newValue!;
                                  });
                                }),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const StatFilter()
                      ],
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      commonSizedBox(20),
                      FutureBuilder<List<TransactionModel>>(
                          future: dbHelper.fetch(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text('Unexpected error');
                            }
                            if (snapshot.hasData) {
                              if (snapshot.data!.isEmpty) {
                                return const SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      'No values found',
                                    ));
                              }
                            }

                            if (snapshot.data == null) {
                              return const Text('Unexpected error');
                            }
                            return ChartWidget(
                              entiredata: snapshot.data!,
                              height: 500,
                            );
                          })
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
