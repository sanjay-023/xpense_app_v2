import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpense_app/main.dart';
//import 'package:studentapp/screen/my_theme.dart';
import 'package:xpense_app/screens/settingscreen/widgets/my_theme.dart';

class ChaneButton extends StatelessWidget {
  const ChaneButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final themeSt = getThemekey();
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
        activeColor: const Color.fromARGB(255, 139, 9, 204),
        value: themeProvider.isDarkMode,
        onChanged: (value) async {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
          final _sharedprfns = await SharedPreferences.getInstance();

          await _sharedprfns.setBool(themeKey, value);
          print(_sharedprfns.getBool(themeKey));
        });
  }
}
