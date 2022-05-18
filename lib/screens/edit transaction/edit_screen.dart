import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpense_app/db/function/db_helper.dart';

import 'package:xpense_app/screens/add%20transaction/widget/date_pick.dart';

import 'package:xpense_app/screens/add%20transaction/widget/trans_type.dart';
import 'package:xpense_app/screens/edit%20transaction/widget/edit_amount_widget.dart';
import 'package:xpense_app/screens/edit%20transaction/widget/edit_category_widget.dart';
import 'package:xpense_app/screens/edit%20transaction/widget/edit_date_widget.dart';
import 'package:xpense_app/screens/home%20screen/dash_screen.dart';

import 'package:xpense_app/screens/home%20screen/widgets/common_widget.dart';

class ScreenEditTransaction extends StatefulWidget {
  ScreenEditTransaction(
      {Key? key,
      required this.amount,
      required this.category,
      required this.date,
      required this.type,
      required this.index})
      : super(key: key);
  final int amount;
  final String category;
  final DateTime date;
  final String type;
  final int index;

  @override
  State<ScreenEditTransaction> createState() => _ScreenEditTransactionState();
}

class _ScreenEditTransactionState extends State<ScreenEditTransaction> {
  final amountcontroller = TextEditingController();

  final categorycontroller = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    commonSizedBox(40),
                    Text(
                      'Edit Transaction',
                      style: GoogleFonts.signika(
                          textStyle: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600)),
                    ),
                    commonSizedBox(30),
                    EditAmountWidget(editAmount: widget.amount),
                    commonSizedBox(20),
                    EditCategoryWidget(editCategory: widget.category),
                    commonSizedBox(20),
                    EditDatepick(editdate: widget.date),
                    commonSizedBox(20),
                    ElevatedButton(
                        onPressed: () async {
                          if (editedCategory.isEmpty || editedamount == 0) {
                            editedCategory = widget.category;
                            editedamount = widget.amount;
                            DbHelper dbHelper = DbHelper();
                            await dbHelper.updateData(editedamount, editedDate,
                                editedCategory, widget.type, widget.index);

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (ctx) {
                              return const ScreenDash();
                            }));
                          } else {
                            DbHelper dbHelper = DbHelper();
                            await dbHelper.updateData(editedamount, editedDate,
                                editedCategory, widget.type, widget.index);

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (ctx) {
                              return const ScreenDash();
                            }));
                            editedamount = 0;
                            editedCategory = '';
                          }
                        },
                        child: const Text('Save'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 139, 9, 204),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize: const Size(150, 40)))
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  showerror(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Not all data provided'),
      backgroundColor: Color.fromARGB(255, 239, 19, 3),
    ));
  }
}