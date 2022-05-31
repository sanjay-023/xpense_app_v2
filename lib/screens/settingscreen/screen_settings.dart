import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xpense_app/screens/home%20screen/dash_screen.dart';
import 'package:xpense_app/screens/home%20screen/widgets/common_widget.dart';
import 'package:xpense_app/screens/home%20screen/widgets/custom_icons.dart';
import 'package:xpense_app/screens/settingscreen/widgets/notification_widget.dart';
import 'package:xpense_app/screens/settingscreen/widgets/privacy_policy.dart';
import 'package:xpense_app/screens/settingscreen/widgets/reset_pop.dart';
import 'package:xpense_app/screens/settingscreen/widgets/setting_widget.dart';
import 'package:timezone/data/latest.dart' as tz;

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({Key? key}) : super(key: key);

  @override
  State<ScreenSettings> createState() => _ScreenSettingsState();
}

class _ScreenSettingsState extends State<ScreenSettings> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                  resetPop(context);
                },
                child: SettingWidget(
                    stext: 'Reset Data', sicon: Icons.restart_alt)),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) {
                      return const PrivacyPolicy();
                    });
              },
              child: SettingWidget(
                  stext: 'Privacy Policy', sicon: Icons.privacy_tip_outlined),
            ),
            SettingWidget(stext: 'Share', sicon: Icons.share_outlined),
            SettingWidget(
                stext: 'Rate This App', sicon: Icons.star_border_outlined),
            InkWell(
                onTap: () {
                  sendMail();
                },
                child: SettingWidget(
                    stext: 'Feedback', sicon: Icons.feedback_outlined)),
            GestureDetector(
                onTap: () {
                  openWeb();
                },
                child: SettingWidget(
                    stext: 'About Us', sicon: MyFlutterApp.warning))
          ],
        )));
  }

  openWeb() async {
    // ignore: deprecated_member_use
    if (!await launch("https://sanjay-023.github.io/myweb/intex.html")) {
      throw 'could not launch';
    }
  }

  sendMail() async {
    // ignore: deprecated_member_use
    if (!await launch(
        "mailto:sdsanjay023@gmail.com?subject=Feedback About Xpense App&body=")) {
      throw 'could not launch';
    }
  }
}
