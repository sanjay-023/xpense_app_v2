import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:xpense_app/db/function/db_helper.dart';
import 'package:xpense_app/db/model/transaction_model.dart';
import 'package:xpense_app/screens/add%20transaction/widget/date_pick.dart';
import 'package:xpense_app/screens/all%20transaction%20screen/widgets/delete_pop.dart';

DbHelper dbHelper = DbHelper();

class RecentTransaction extends StatefulWidget {
  List<TransactionModel> data;
  List<String> month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  RecentTransaction({Key? key, required this.data}) : super(key: key);

  @override
  State<RecentTransaction> createState() => _RecentTransactionState();
}

class _RecentTransactionState extends State<RecentTransaction> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        reverse: true,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.data.length,
        itemBuilder: ((context, index) {
          TransactionModel dataAtIndex;
          try {
            dataAtIndex = widget.data[index];
          } catch (e) {
            return Container();
          }
          if (dataAtIndex.type == "Income") {
            return incomeTileWidget(dataAtIndex.amount, dataAtIndex.category,
                dataAtIndex.date, index);
          } else {
            return expenseTileWidget(dataAtIndex.amount, dataAtIndex.category,
                dataAtIndex.date, index);
          }
        }));
  }

  expenseTileWidget(int value, String category, DateTime date, int index) {
    return Slidable(
      startActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            delete(context, index);
            setState(() {});
          },
          backgroundColor: const Color.fromARGB(255, 213, 20, 6),
          label: 'Delete',
          icon: Icons.delete,
        )
      ]),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 205, 203, 203),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                      backgroundColor: Color.fromARGB(255, 224, 19, 5),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Debit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                                '${date.day} ${widget.month[selectedDate.month - 1]}')
                          ],
                        ),
                        // Text('date')
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "- $value",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(category)
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  incomeTileWidget(int value, String category, DateTime date, int index) {
    return Slidable(
      startActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            delete(context, index);
            setState(() {});
          },
          backgroundColor: const Color.fromARGB(255, 213, 20, 6),
          label: 'Delete',
          icon: Icons.delete,
        )
      ]),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 205, 203, 203),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      backgroundColor: Color.fromARGB(255, 9, 177, 3),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Credit',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                            '${date.day} ${widget.month[selectedDate.month - 1]}')
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "+ $value",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(category)
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
