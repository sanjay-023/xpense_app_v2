import 'package:flutter/material.dart';
import 'package:xpense_app/screens/home%20screen/dash_screen.dart';
import 'package:xpense_app/screens/home%20screen/widgets/recent_transaction_widget.dart';

void resetPop(ctx) {
  showDialog(
      context: ctx,
      builder: (ctx1) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you really want to reset the data?'),
          actions: [
            TextButton(
                onPressed: () {
                  dbHelper.resetData();
                  Navigator.of(ctx1)
                      .pushReplacement(MaterialPageRoute(builder: (ctx2) {
                    return ScreenDash();
                  }));
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
