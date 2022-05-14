import 'package:flutter/material.dart';
import 'package:xpense_app/screens/home%20screen/dash_screen.dart';

class SettingWidget extends StatelessWidget {
  SettingWidget({Key? key, required this.stext, required this.sicon})
      : super(key: key);
  String stext;
  IconData sicon;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
          return const ScreenDash();
        }));
        return false;
      },
      child: ListTile(
        leading: Icon(
          sicon,
          color: Colors.black,
          size: 24,
        ),
        title: Text(
          stext,
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
