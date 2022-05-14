import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpense_app/db/function/db_helper.dart';
import 'package:xpense_app/main.dart';
import 'package:xpense_app/screens/add%20transaction/widget/amount_widget.dart';
import 'package:xpense_app/screens/home%20screen/widgets/balance_card_widget.dart';
import 'package:xpense_app/screens/home%20screen/widgets/chart_widget.dart';
import 'package:xpense_app/screens/home%20screen/widgets/common_widget.dart';
import 'package:xpense_app/screens/home%20screen/widgets/recent_transaction_widget.dart';
import 'package:xpense_app/screens/statistics/screen_statistics.dart';

String profName = '';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int totalBalance = 0;
  int totalIncome = 0;
  int totalExpense = 0;
  @override
  void initState() {
    getProfileName();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenStatistics screenStatistics = ScreenStatistics();
    page = true;
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
                Text(
                  'Welcome,$profName',
                  style: GoogleFonts.signika(
                      textStyle: const TextStyle(fontSize: 24)),
                ),
              ],
            ),
            commonSizedBox(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dateWidget('April', true),
                  dateWidget('May', false),
                  dateWidget('Jun', false),
                  dateWidget('Jul', false),
                  dateWidget('Aug', false)
                ],
              ),
            ),
            commonSizedBox(30),
            FutureBuilder<Map>(
                future: dbHelper.fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Unexpected error');
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Text('No values found');
                    }
                  }

                  if (snapshot.data == null) {
                    return const Text('Unexpected error');
                  }

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
                      RecentTransaction(data: snapshot.data!),
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

  getTotalBalance(Map entiredata) {
    totalBalance = 0;
    totalExpense = 0;
    totalIncome = 0;
    entiredata.forEach((key, value) {
      //print(value);
      if (value['type'] == 'Income') {
        totalBalance += (value['amount'] as int);
        totalIncome += (value['amount'] as int);
      } else {
        totalBalance -= (value['amount'] as int);
        totalExpense += (value['amount'] as int);
        amount = 0;
      }
    });
    // print(totalBalance);
    // print(totalIncome);
    // print(totalExpense);
  }
}
