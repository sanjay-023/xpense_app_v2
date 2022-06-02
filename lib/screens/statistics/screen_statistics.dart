import 'package:flutter/material.dart';
import 'package:xpense_app/db/function/db_helper.dart';
import 'package:xpense_app/screens/home%20screen/dash_screen.dart';
import 'package:xpense_app/screens/home%20screen/widgets/chart_widget.dart';
import 'package:xpense_app/screens/home%20screen/widgets/common_widget.dart';

import '../../db/model/transaction_model.dart';

int statIndex = 1;

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
            foregroundColor: Theme.of(context).secondaryHeaderColor,
          ),
          body: SingleChildScrollView(
            child: Padding(
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
                            width: MediaQuery.of(context).size.width * 0.26,
                            height: MediaQuery.of(context).size.height * 0.05,
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
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    statIndex = 1;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.26,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      color: statIndex == 1
                                          ? const Color.fromARGB(
                                              255, 139, 9, 204)
                                          : const Color.fromARGB(
                                              255, 186, 185, 185),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text(
                                    'This Month',
                                    style: TextStyle(
                                        color: statIndex == 1
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 99, 98, 98)),
                                  )),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    statIndex = 2;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.26,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      color: statIndex == 2
                                          ? const Color.fromARGB(
                                              255, 139, 9, 204)
                                          : const Color.fromARGB(
                                              255, 186, 185, 185),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text(
                                    'This Year',
                                    style: TextStyle(
                                        color: statIndex == 2
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 99, 98, 98)),
                                  )),
                                ),
                              ),
                            ],
                          )
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
                                return const Text('');
                              }
                              if (snapshot.hasData) {
                                if (snapshot.data!.isEmpty) {
                                  return SizedBox(
                                      width: double.infinity,
                                      child: Center(
                                        child: Column(
                                          children: [
                                            commonSizedBox(30),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.35,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/chart_nodata.png'))),
                                            ),
                                            commonSizedBox(20),
                                            const Text(
                                              'No Records',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 124, 124, 124),
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ));
                                }
                              }

                              if (snapshot.data == null) {
                                return const Text('');
                              }

                              return ChartWidget(
                                entiredata: snapshot.data!,
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                              );
                            })
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
