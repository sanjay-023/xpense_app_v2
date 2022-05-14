import 'package:hive_flutter/hive_flutter.dart';

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

  Future<Map> fetchData() {
    final box = Hive.box('money');
    if (box.values.isEmpty) {
      return Future.value({});
    } else {
      return Future.value(box.toMap());
    }
  }
}
