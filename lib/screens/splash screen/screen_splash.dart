import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpense_app/main.dart';
import 'package:xpense_app/screens/home%20screen/dash_screen.dart';
import 'package:xpense_app/screens/onboarding%20screen/onboard_screen.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 139, 9, 204),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/images/xpense-logo-new.png'),
              width: 280,
              height: 280,
            ),
          ],
        ),
      ),
    );
  }

  void gotoonboard() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return const ScreenOnboard();
    }));
  }

  void checkUserLoggedIn() async {
    final _sharedprfns = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedprfns.getString(saveKey);

    if (_userLoggedIn == null || _userLoggedIn.isEmpty) {
      gotoonboard();
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return ScreenDash();
      }));
    }
  }
}
