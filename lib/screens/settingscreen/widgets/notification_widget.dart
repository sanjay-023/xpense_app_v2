import 'package:flutter/material.dart';
import 'package:xpense_app/screens/home%20screen/widgets/custom_icons.dart';
import 'package:xpense_app/screens/settingscreen/widgets/botton_sheet.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (builder) {
              return const BottomSheetNot();
            });
      },
      child: ListTile(
          leading: Icon(
            MyFlutterApp.notification,
            color: Theme.of(context).secondaryHeaderColor,
            size: 24,
          ),
          title: const Text(
            'Remainder',
            style: TextStyle(fontSize: 22),
          ),
          trailing: const Icon(Icons.arrow_forward_ios)),
    );
  }
}
