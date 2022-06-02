import 'package:flutter/material.dart';
import 'package:xpense_app/db/model/transaction_model.dart';
import 'package:xpense_app/screens/all%20transaction%20screen/screen_all_transaction.dart';

class HomeRecentWidget extends StatefulWidget {
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
  HomeRecentWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<HomeRecentWidget> createState() => _HomeRecentWidgetState();
}

class _HomeRecentWidgetState extends State<HomeRecentWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.data.length < 5 ? widget.data.length : 5,
        itemBuilder: ((context, index) {
          final newList = widget.data.reversed;
          TransactionModel dataAtIndex;
          try {
            dataAtIndex = newList.elementAt(index);
          } catch (e) {
            return Container();
          }

          if (dataAtIndex.type == "Income") {
            return incomeTileWidget(dataAtIndex.amount, dataAtIndex.category,
                dataAtIndex.date, dataAtIndex.type, index);
          } else if (dataAtIndex.type == "Expense") {
            return expenseTileWidget(dataAtIndex.amount, dataAtIndex.category,
                dataAtIndex.date, dataAtIndex.type, index);
          } else {
            return Container();
          }
        }));
  }

  expenseTileWidget(
      int value, String category, DateTime date, String edittype, int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return const ScreenAllTransaction();
        }));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
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
                            Text('${date.day} ${widget.month[date.month - 1]}')
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

  incomeTileWidget(
      int value, String category, DateTime date, String edittype, int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return const ScreenAllTransaction();
        }));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
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
                        Text('${date.day} ${widget.month[date.month - 1]}')
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
