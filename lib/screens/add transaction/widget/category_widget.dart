import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:xpense_app/screens/add%20transaction/widget/suggestion.dart';
import 'package:xpense_app/screens/home%20screen/screen_home.dart';
import 'package:xpense_app/screens/home%20screen/widgets/custom_icons.dart';

String category = '';
SuggestionList suggestionList = SuggestionList();

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (totalData == null) {
      const Text('Unexpected error');
    }

    return Container(
      width: 320,
      height: 60,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 139, 9, 204),
              child: Icon(
                MyFlutterApp.category,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                  width: 210,
                  height: 60,
                  child: Form(
                    child: TypeAheadFormField<String?>(
                      hideOnEmpty: true,
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: categoryController,
                        onChanged: (val) {
                          category = val;
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          hintText: 'Category',
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                        ),
                      ),
                      onSuggestionSelected: (String? suggestion) {
                        if (suggestion == null) {
                          "";
                        }
                        categoryController.text = suggestion!;
                        category = categoryController.text;
                      },
                      itemBuilder: (context, String? suggestion) {
                        return ListTile(
                          title: Text(suggestion!),
                        );
                      },
                      suggestionsCallback: (pattern) {
                        if (pattern.isNotEmpty) {
                          return SuggestionList.getSuggestions(pattern);
                        } else {
                          return [];
                        }
                      },
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
