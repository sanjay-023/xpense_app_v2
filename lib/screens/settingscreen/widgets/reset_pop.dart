import 'package:flutter/material.dart';
import 'package:xpense_app/screens/home%20screen/widgets/recent_transaction_widget.dart';
import 'package:xpense_app/screens/splash%20screen/screen_splash.dart';

void resetPop(ctx) {
  showDialog(
      context: ctx,
      builder: (ctx1) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you really want to reset the data?'),
          actions: [
            TextButton(
                onPressed: () async {
                  dbHelper.resetData();
                  dbHelper.resetShared();

                  Navigator.of(ctx).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (ctx) {
                    return const ScreenSplash();
                  }), (route) => false);
                },
                child: const Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.of(ctx1).pop();
                },
                child: const Text('No'))
          ],
        );
      });
}
