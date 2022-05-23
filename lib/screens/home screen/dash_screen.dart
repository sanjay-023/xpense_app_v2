// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'package:xpense_app/screens/add%20transaction/screen_transaction.dart';
import 'package:xpense_app/screens/all%20transaction%20screen/screen_all_transaction.dart';
import 'package:xpense_app/screens/home%20screen/screen_home.dart';
import 'package:xpense_app/screens/settingscreen/screen_settings.dart';
import 'package:xpense_app/screens/statistics/screen_statistics.dart';

class ScreenDash extends StatefulWidget {
  const ScreenDash({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenDash> createState() => _ScreenDashState();
}

class _ScreenDashState extends State<ScreenDash> {
  int _currentSelectedIntex = 0;
  @override
  Widget build(BuildContext context) {
    final _pages = [
      const ScreenHome(),
      const ScreenAllTransaction(),
      const ScreenAddTransaction(),
      const ScreenStatistics(),
      const ScreenSettings()
    ];
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: SizedBox(
          height: 68,
          width: 68,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 139, 9, 204),
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return const ScreenAddTransaction();
                }));
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          _pages.elementAt(_currentSelectedIntex),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: const Color.fromARGB(255, 139, 9, 204),
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    currentIndex: _currentSelectedIntex,
                    onTap: (newIntex) {
                      setState(() {
                        _currentSelectedIntex = newIntex;
                      });
                    },
                    backgroundColor: const Color.fromARGB(255, 213, 212, 212),
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.home,
                            size: 30,
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.list,
                            size: 30,
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.search,
                            size: 30,
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.bar_chart,
                            size: 30,
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.settings,
                            size: 30,
                          ),
                          label: '')
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
