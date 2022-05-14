import 'package:flutter/material.dart';
import 'package:xpense_app/db/function/db_helper.dart';
import 'package:xpense_app/screens/home%20screen/dash_screen.dart';
import 'package:xpense_app/screens/home%20screen/widgets/common_widget.dart';
import 'package:xpense_app/screens/home%20screen/widgets/recent_transaction_widget.dart';

class ScreenAllTransaction extends StatelessWidget {
  ScreenAllTransaction({Key? key}) : super(key: key);
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
                        dateWidget('April', true),
                        dateWidget('May', false),
                        dateWidget('Jun', false),
                        dateWidget('Jul', false),
                        dateWidget('Aug', false)
                      ],
                    ),
                  ),
                  commonSizedBox(20),
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
                        return Column(
                          children: [
                            RecentTransaction(data: snapshot.data!),
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
