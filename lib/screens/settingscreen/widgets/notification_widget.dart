import 'package:flutter/material.dart';
import 'package:xpense_app/screens/home%20screen/widgets/custom_icons.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool value = true;
    return ListTile(
      leading: const Icon(
        MyFlutterApp.notification,
        color: Colors.black,
        size: 24,
      ),
      title: const Text(
        'Notification',
        style: TextStyle(fontSize: 22),
      ),
      trailing: Switch.adaptive(value: value, onChanged: (value) {}),
    );
  }
}
