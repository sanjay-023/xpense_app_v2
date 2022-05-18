import 'package:flutter/material.dart';
import 'package:xpense_app/screens/home%20screen/widgets/custom_icons.dart';

String category = '';
String editedCategory = '';

class EditCategoryWidget extends StatefulWidget {
  EditCategoryWidget({Key? key, required this.editCategory}) : super(key: key);
  String editCategory;

  @override
  State<EditCategoryWidget> createState() => _EditCategoryWidgetState();
}

class _EditCategoryWidgetState extends State<EditCategoryWidget> {
  final editCategoryController = TextEditingController();
  // @override
  // void initState() {
  //   editCategoryController.text = widget.editCategory;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    editCategoryController.text = widget.editCategory;
    editedCategory = editCategoryController.text;
    return Container(
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
                MyFlutterApp.category,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                width: 210,
                height: 60,
                child: TextField(
                  controller: editCategoryController,
                  onChanged: (val) {
                    editedCategory = val;
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: 'Category',
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
