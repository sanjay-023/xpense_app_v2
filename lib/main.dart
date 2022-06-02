import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:xpense_app/screens/settingscreen/widgets/my_theme.dart';
import 'package:xpense_app/screens/splash%20screen/screen_splash.dart';
import 'package:timezone/data/latest.dart' as tz;

const saveKey = 'profile name';
const themeKey = "themekey";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  final appdocumentdir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appdocumentdir.path);
  await Hive.openBox('money');

  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: const ScreenSplash(),
          );
        });
  }
}
