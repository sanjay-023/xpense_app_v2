import 'package:xpense_app/db/model/transaction_model.dart';

List<String> suggestiondata = [];

class SuggestionList {
  void suggestion({required List<TransactionModel> entireData}) {
    if (entireData.isEmpty) {
      [];
    }
    for (TransactionModel data in entireData) {
      if (data.category.isNotEmpty) {
        suggestiondata.add(data.category);
      }
    }
  }

  static List<String> getSuggestions(String query) => List.of(suggestiondata)
      .where((suggestion) {
        final suggestionLower = suggestion.toLowerCase();
        final queryLower = query.toLowerCase();

        return suggestionLower.contains(queryLower);
      })
      .toSet()
      .toList();
}
