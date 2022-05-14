import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xpense_app/screens/home%20screen/dash_screen.dart';
import 'package:xpense_app/screens/home%20screen/widgets/common_widget.dart';
import 'package:xpense_app/screens/home%20screen/widgets/custom_icons.dart';
import 'package:xpense_app/screens/settingscreen/widgets/notification_widget.dart';
import 'package:xpense_app/screens/settingscreen/widgets/setting_widget.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          title: const Text(
            'Settings',
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            commonSizedBox(10),
            const NotificationWidget(),
            GestureDetector(
                onTap: () {
                  print('reset clicked');
                },
                child: SettingWidget(
                    stext: 'Reset Data', sicon: Icons.restart_alt)),
            SettingWidget(
                stext: 'Privacy Policy', sicon: Icons.privacy_tip_outlined),
            SettingWidget(stext: 'Share', sicon: Icons.share_outlined),
            SettingWidget(
                stext: 'Rate This App', sicon: Icons.star_border_outlined),
            SettingWidget(stext: 'Feedback', sicon: Icons.feedback_outlined),
            GestureDetector(
                onTap: () {
                  openUrl();
                },
                child: SettingWidget(
                    stext: 'About Us', sicon: MyFlutterApp.warning))
          ],
        )));
  }

  openUrl() async {
    if (!await canLaunchUrl(
        Uri.parse("https://sanjay-023.github.io/myweb/intex.html"))) {
      !await launchUrl(
          Uri.parse("https://sanjay-023.github.io/myweb/intex.html"));
    } else {
      throw "Could not launch url";
    }
  }
}
