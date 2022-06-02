import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:xpense_app/screens/settingscreen/widgets/my_theme.dart';

class ChaneButton extends StatefulWidget {
  const ChaneButton({Key? key}) : super(key: key);

  @override
  State<ChaneButton> createState() => _ChaneButtonState();
}

class _ChaneButtonState extends State<ChaneButton> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Switch.adaptive(
        activeColor: const Color.fromARGB(255, 139, 9, 204),
        value: themeChange.darkTheme,
        onChanged: (value) {
          setState(() {
            themeChange.darkTheme = value;
          });
        });
  }
}
