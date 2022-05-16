import 'package:hive_flutter/hive_flutter.dart';
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

  Future<Map> fetchData() {
    final box = Hive.box('money');
    if (box.values.isEmpty) {
      return Future.value({});
    } else {
      return Future.value(box.toMap());
    }
  }

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
      });
      return items;
    }
  }

  Future deleteData(int index) async {
    final box = Hive.box('money');
    await box.deleteAt(index);
  }
}
