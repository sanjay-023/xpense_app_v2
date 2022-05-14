import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xpense_app/screens/splash%20screen/screen_splash.dart';

const saveKey = 'profile name';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appdocumentdir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appdocumentdir.path);
  await Hive.openBox('money');

  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 139, 9, 204)),
      home: const ScreenSplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
