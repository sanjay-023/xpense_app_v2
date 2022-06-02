import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:xpense_app/db/model/transaction_model.dart';

class DbHelper {
  Future adddata(
      int? amount, DateTime date, String category, String type) async {
    final box = Hive.box('money');
    var value = {
      "amount": amount,
      "date": date,
      "category": category,
      "type": type
    };
    box.add(value);
  }

  // Future<Map> fetchData() {
  //   final box = Hive.box('money');
  //   if (box.values.isEmpty) {
  //     return Future.value({});
  //   } else {
  //     return Future.value(box.toMap());
  //   }
  // }

  Future<List<TransactionModel>> fetch() async {
    final box = Hive.box('money');
    if (box.values.isEmpty) {
      return Future.value([]);
    } else {
      List<TransactionModel> items = [];
      box.toMap().values.forEach((element) {
        //print(element);
        items.add(TransactionModel(element['amount'] as int,
            element['date'] as DateTime, element['category'], element['type']));
        //print(element);
      });
      return items;
    }
  }

  Future deleteData(int index) async {
    final box = Hive.box('money');
    await box.deleteAt(index);
  }

  Future updateData(int? amount, DateTime date, String category, String type,
      int index) async {
    final box = Hive.box('money');
    var value = {
      "amount": amount,
      "date": date,
      "category": category,
      "type": type
    };
    box.putAt(index, value);
  }

  void resetData() {
    final box = Hive.box('money');
    box.clear();
  }

  void resetShared() async {
    final _sharedprfns = await SharedPreferences.getInstance();
    _sharedprfns.clear();
  }

  // void resetTheme() async {
  //   final _sharedprfns = await SharedPreferences.getInstance();
  //   _sharedprfns.remove(THEME_STATUS);
  // }
}
