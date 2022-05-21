import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:xpense_app/screens/home%20screen/dash_screen.dart';
import 'package:xpense_app/screens/home%20screen/widgets/common_widget.dart';
import 'package:xpense_app/screens/settingscreen/widgets/notification_service.dart';

class BottomSheetNot extends StatefulWidget {
  const BottomSheetNot({Key? key}) : super(key: key);

  @override
  State<BottomSheetNot> createState() => _BottomSheetNotState();
}

class _BottomSheetNotState extends State<BottomSheetNot> {
  TimeOfDay? pickedTime;
  TimeOfDay currentTimme = TimeOfDay.now();
  final messageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationService().init(initScheduled: true);
  }

  void listenNotifiication() {
    NotificationService.onNotifications.listen((onClickNotification));
  }

  onClickNotification(String? payload) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return const ScreenDash();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 550,
        child: Column(
          children: [
            commonSizedBox(20),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Set Remainder",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            commonSizedBox(30),
            Column(
              children: [
                Container(
                  width: 320,
                  height: 60,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 227, 225, 225),
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 139, 9, 204),
                          child: Icon(
                            Icons.note,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SizedBox(
                            width: 210,
                            height: 60,
                            child: TextField(
                              controller: messageController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                hintText: 'What to Remind?',
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () async {
                      pickedTime = await showTimePicker(
                          context: context, initialTime: currentTimme);
                      // if (pickedTime != null && pickedTime != currentTimme) {
                      //   setState(() {
                      //     NotificationService.showScheduledNotifications(
                      //         title: 'Xpense App',
                      //         body: messageController.text,
                      //         scheduledTime: Time(
                      //             pickedTime!.hour, pickedTime!.minute, 0));
                      //   });
                      // }
                    },
                    child: const Text(
                      'Set Timer',
                      style: TextStyle(
                          color: Color.fromARGB(255, 139, 9, 204),
                          fontSize: 19),
                    )),
                commonSizedBox(10),
                ElevatedButton(
                    onPressed: () {
                      if (pickedTime != null && pickedTime != currentTimme) {
                        setState(() {
                          NotificationService.showScheduledNotifications(
                              title: 'Xpense App',
                              body: messageController.text,
                              scheduledTime: Time(
                                  pickedTime!.hour, pickedTime!.minute, 0));
                        });
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text('Done'),
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 139, 9, 204),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        minimumSize: const Size(150, 40)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
