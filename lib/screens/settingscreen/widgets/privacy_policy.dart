import 'package:flutter/material.dart';
import 'package:xpense_app/screens/home%20screen/widgets/common_widget.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Column(
        children: [
          commonSizedBox(10),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Privacy Policy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          commonSizedBox(10),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                    ''' This privacy notice for Xpense  describes how and why we might collect, store, use, and/or share ("process") your information when you use our services ("Services"), such as when you:

Questions or concerns?If you do not agree with our policies and practices, please do not use our Services. If you still have any questions or concerns, please contact us at support@xpense.com.'''),
              ),
              commonSizedBox(40),
              ElevatedButton(
                  onPressed: () {
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
    );
  }
}
