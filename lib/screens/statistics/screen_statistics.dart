import 'package:flutter/material.dart';
import 'package:xpense_app/db/function/db_helper.dart';
import 'package:xpense_app/screens/home%20screen/dash_screen.dart';
import 'package:xpense_app/screens/home%20screen/widgets/chart_widget.dart';
import 'package:xpense_app/screens/home%20screen/widgets/common_widget.dart';

import '../../db/model/transaction_model.dart';

bool page = true;

class ScreenStatistics extends StatelessWidget {
  const ScreenStatistics({Key? key}) : super(key: key);

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
                        dateWidget('April', true),
                        dateWidget('May', false),
                        dateWidget('Jun', false),
                        dateWidget('Jul', false),
                        dateWidget('Aug', false)
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
                                return const Center(
                                    child: Text('No values found'));
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
