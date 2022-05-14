import 'package:flutter/material.dart';

class RecentTransaction extends StatefulWidget {
  Map data;
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
          Map dataAtIndex = widget.data[index];
          if (dataAtIndex["type"] == "Income") {
            return incomeTileWidget(
                dataAtIndex['amount'], dataAtIndex["category"]);
          } else {
            return expenseTileWidget(
                dataAtIndex['amount'], dataAtIndex["category"]);
          }
        }));
  }

  expenseTileWidget(int value, String category) {
    return Container(
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
                    children: const [
                      Text(
                        'Debit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
    );
  }

  incomeTileWidget(int value, String category) {
    return Container(
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
                children: const [
                  CircleAvatar(
                    child: Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    backgroundColor: Color.fromARGB(255, 9, 177, 3),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Credit',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
    );
  }
}
