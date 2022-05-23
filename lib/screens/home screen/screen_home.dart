import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpense_app/db/function/db_helper.dart';
import 'package:xpense_app/db/model/transaction_model.dart';
import 'package:xpense_app/main.dart';
import 'package:xpense_app/screens/home%20screen/widgets/balance_card_widget.dart';
import 'package:xpense_app/screens/home%20screen/widgets/chart_widget.dart';
import 'package:xpense_app/screens/home%20screen/widgets/common_widget.dart';
import 'package:xpense_app/screens/home%20screen/widgets/home_recent_widget.dart';
import 'package:xpense_app/screens/home%20screen/widgets/select_month.dart';
import 'package:xpense_app/screens/home%20screen/widgets/time_check.dart';
import 'package:xpense_app/screens/statistics/screen_statistics.dart';

String profName = '';
var totalData;

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  DbHelper dbHelper = DbHelper();
  int totalBalance = 0;
  int totalIncome = 0;
  int totalExpense = 0;
  @override
  void initState() {
    getProfileName();
    dbHelper.fetch();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    statDropDownValue = 'Expense';
    //page = true;
    DbHelper dbHelper = DbHelper();
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(26),
      child: SizedBox(
        child: ListView(
          children: [
            Row(
              children: [
                timecontrol(),
                Text(
                  profName,
                  style: GoogleFonts.signika(
                      textStyle: const TextStyle(fontSize: 22)),
                ),
              ],
            ),
            commonSizedBox(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      monthIndex = 3;
                      today = DateTime(now.year, now.month - 2, today.day);
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: monthIndex == 3
                            ? const Color.fromARGB(255, 139, 9, 204)
                            : const Color.fromARGB(255, 214, 213, 213)),
                    alignment: Alignment.center,
                    child: Text(
                      months[now.month - 3],
                      style: TextStyle(
                          fontSize: 18,
                          color: monthIndex == 3 ? Colors.white : Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      monthIndex = 2;
                      today = DateTime(now.year, now.month - 1, today.day);
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: monthIndex == 2
                            ? const Color.fromARGB(255, 139, 9, 204)
                            : const Color.fromARGB(255, 214, 213, 213)),
                    alignment: Alignment.center,
                    child: Text(
                      months[now.month - 2],
                      style: TextStyle(
                          fontSize: 18,
                          color: monthIndex == 2 ? Colors.white : Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      monthIndex = 1;
                      today = DateTime.now();
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: monthIndex == 1
                            ? const Color.fromARGB(255, 139, 9, 204)
                            : const Color.fromARGB(255, 214, 213, 213)),
                    alignment: Alignment.center,
                    child: Text(
                      months[now.month - 1],
                      style: TextStyle(
                          fontSize: 18,
                          color: monthIndex == 1 ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            commonSizedBox(30),
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

                  totalData = snapshot.data!;

                  getTotalBalance(snapshot.data!);
                  return Column(
                    children: [
                      BalanceCard(
                          totalbal: totalBalance,
                          totalIncome: totalIncome,
                          totalExpense: totalExpense),
                      commonSizedBox(20),
                      Row(
                        children: const [
                          Text(
                            'Expense',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ],
                      ),
                      commonSizedBox(20),
                      ChartWidget(
                        height: 300,
                        entiredata: snapshot.data!,
                      ),
                      commonSizedBox(20),
                      Row(
                        children: const [
                          Text(
                            'Recent Transactions',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ],
                      ),
                      commonSizedBox(20),
                      //RecentTransaction(data: snapshot.data!),
                      HomeRecentWidget(data: snapshot.data!),
                      commonSizedBox(60),
                    ],
                  );
                }),
          ],
        ),
      ),
    )));
  }

  getProfileName() async {
    final _sharedprfns = await SharedPreferences.getInstance();
    final profileName = _sharedprfns.getString(saveKey);
    profName = profileName!;
    setState(() {});
  }

  getTotalBalance(List<TransactionModel> entiredata) {
    //SelectMonth selectMonth = SelectMonth();
    //final today = DateTime.now();

    totalBalance = 0;
    totalExpense = 0;
    totalIncome = 0;

    for (TransactionModel data in entiredata) {
      if (data.date.month == today.month) {
        if (data.type == "Income") {
          totalBalance += data.amount;
          totalIncome += data.amount;
        } else {
          totalBalance -= data.amount;
          totalExpense += data.amount;
        }
      }
    }
  }
}
