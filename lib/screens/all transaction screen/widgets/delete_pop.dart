import 'package:flutter/material.dart';
import 'package:xpense_app/screens/all%20transaction%20screen/screen_all_transaction.dart';

import 'package:xpense_app/screens/home%20screen/widgets/recent_transaction_widget.dart';

void delete(ctx, index) {
  showDialog(
      context: ctx,
      builder: (ctx1) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you really want to delete the transaction?'),
          actions: [
            TextButton(
                onPressed: () {
                  dbHelper.deleteData(index);
                  Navigator.pushAndRemoveUntil(ctx1,
                      MaterialPageRoute(builder: (ctx) {
                    return const ScreenAllTransaction();
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
