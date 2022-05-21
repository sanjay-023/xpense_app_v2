import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:xpense_app/db/function/db_helper.dart';
import 'package:xpense_app/db/model/transaction_model.dart';
import 'package:xpense_app/screens/all%20transaction%20screen/screen_all_transaction.dart';
import 'package:xpense_app/screens/all%20transaction%20screen/widgets/delete_pop.dart';
import 'package:xpense_app/screens/edit%20transaction/edit_screen.dart';

DbHelper dbHelper = DbHelper();
String dropDownValue = 'All';

class AllTransWidget extends StatefulWidget {
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
  AllTransWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<AllTransWidget> createState() => _AllTransWidgetState();
}

class _AllTransWidgetState extends State<AllTransWidget> {
  @override
  Widget build(BuildContext context) {
    DateTime todayFil = DateTime.now();
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

          if (dropDownValue == 'Income' && dataAtIndex.type == 'Income') {
            if (datFilterValue == 'Today') {
              if (dataAtIndex.date.month == todayFil.month &&
                  dataAtIndex.date.day == todayFil.day) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              }
            } else if (datFilterValue == 'Yesterday') {
              if (dataAtIndex.date.month == todayFil.month &&
                  dataAtIndex.date.day == todayFil.day - 1) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              }
            } else if (datFilterValue == 'This Month') {
              if (dataAtIndex.date.month == todayFil.month) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              }
            } else if (datFilterValue == 'All') {
              return incomeTileWidget(dataAtIndex.amount, dataAtIndex.category,
                  dataAtIndex.date, dataAtIndex.type, index);
            } else if (datFilterValue == 'This Year') {
              if (yearFilterValue == 'Jan' && dataAtIndex.date.month == 1) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Feb' &&
                  dataAtIndex.date.month == 2) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Mar' &&
                  dataAtIndex.date.month == 3) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Apr' &&
                  dataAtIndex.date.month == 4) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'May' &&
                  dataAtIndex.date.month == 5) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Jun' &&
                  dataAtIndex.date.month == 6) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Jul' &&
                  dataAtIndex.date.month == 7) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Aug' &&
                  dataAtIndex.date.month == 8) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Sep' &&
                  dataAtIndex.date.month == 9) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Oct' &&
                  dataAtIndex.date.month == 10) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Nov' &&
                  dataAtIndex.date.month == 11) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Dec' &&
                  dataAtIndex.date.month == 12) {
                return incomeTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              }
            }
            return Container();
          } else if (dropDownValue == 'Expense' &&
              dataAtIndex.type == 'Expense') {
            if (datFilterValue == 'All') {
              return expenseTileWidget(dataAtIndex.amount, dataAtIndex.category,
                  dataAtIndex.date, dataAtIndex.type, index);
            } else if (datFilterValue == 'Today') {
              if (dataAtIndex.date.month == todayFil.month &&
                  dataAtIndex.date.day == todayFil.day) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              }
            } else if (datFilterValue == 'Yesterday') {
              if (dataAtIndex.date.month == todayFil.month &&
                  dataAtIndex.date.day == todayFil.day - 1) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              }
            } else if (datFilterValue == 'This Month') {
              if (dataAtIndex.date.month == todayFil.month) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              }
            } else if (datFilterValue == 'This Year') {
              if (yearFilterValue == 'Jan' && dataAtIndex.date.month == 1) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Feb' &&
                  dataAtIndex.date.month == 2) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Mar' &&
                  dataAtIndex.date.month == 3) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Apr' &&
                  dataAtIndex.date.month == 4) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'May' &&
                  dataAtIndex.date.month == 5) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Jun' &&
                  dataAtIndex.date.month == 6) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Jul' &&
                  dataAtIndex.date.month == 7) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Aug' &&
                  dataAtIndex.date.month == 8) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Sep' &&
                  dataAtIndex.date.month == 9) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Oct' &&
                  dataAtIndex.date.month == 10) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Nov' &&
                  dataAtIndex.date.month == 11) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              } else if (yearFilterValue == 'Dec' &&
                  dataAtIndex.date.month == 12) {
                return expenseTileWidget(
                    dataAtIndex.amount,
                    dataAtIndex.category,
                    dataAtIndex.date,
                    dataAtIndex.type,
                    index);
              }
            }

            return Container();
          } else {
            if (dropDownValue == "All") {
              if (dataAtIndex.type == "Income") {
                if (datFilterValue == 'All') {
                  return incomeTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index);
                } else if (datFilterValue == 'Today') {
                  if (dataAtIndex.date.month == todayFil.month &&
                      dataAtIndex.date.day == todayFil.day) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  }
                } else if (datFilterValue == 'Yesterday') {
                  if (dataAtIndex.date.month == todayFil.month &&
                      dataAtIndex.date.day == todayFil.day - 1) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  }
                } else if (datFilterValue == 'This Month') {
                  if (dataAtIndex.date.month == todayFil.month) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  }
                } else if (datFilterValue == 'This Year') {
                  if (yearFilterValue == 'Jan' && dataAtIndex.date.month == 1) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Feb' &&
                      dataAtIndex.date.month == 2) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Mar' &&
                      dataAtIndex.date.month == 3) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Apr' &&
                      dataAtIndex.date.month == 4) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'May' &&
                      dataAtIndex.date.month == 5) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Jun' &&
                      dataAtIndex.date.month == 6) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Jul' &&
                      dataAtIndex.date.month == 7) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Aug' &&
                      dataAtIndex.date.month == 8) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Sep' &&
                      dataAtIndex.date.month == 9) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Oct' &&
                      dataAtIndex.date.month == 10) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Nov' &&
                      dataAtIndex.date.month == 11) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Dec' &&
                      dataAtIndex.date.month == 12) {
                    return incomeTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  }
                }
                return Container();
              } else {
                if (datFilterValue == 'All') {
                  return expenseTileWidget(
                      dataAtIndex.amount,
                      dataAtIndex.category,
                      dataAtIndex.date,
                      dataAtIndex.type,
                      index);
                } else if (datFilterValue == 'Today') {
                  if (dataAtIndex.date.month == todayFil.month &&
                      dataAtIndex.date.day == todayFil.day) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  }
                } else if (datFilterValue == 'Yesterday') {
                  if (dataAtIndex.date.month == todayFil.month &&
                      dataAtIndex.date.day == todayFil.day - 1) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  }
                } else if (datFilterValue == 'This Month') {
                  if (dataAtIndex.date.month == todayFil.month) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  }
                } else if (datFilterValue == 'This Year') {
                  if (yearFilterValue == 'Jan' && dataAtIndex.date.month == 1) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Feb' &&
                      dataAtIndex.date.month == 2) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Mar' &&
                      dataAtIndex.date.month == 3) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Apr' &&
                      dataAtIndex.date.month == 4) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'May' &&
                      dataAtIndex.date.month == 5) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Jun' &&
                      dataAtIndex.date.month == 6) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Jul' &&
                      dataAtIndex.date.month == 7) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Aug' &&
                      dataAtIndex.date.month == 8) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Sep' &&
                      dataAtIndex.date.month == 9) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Oct' &&
                      dataAtIndex.date.month == 10) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Nov' &&
                      dataAtIndex.date.month == 11) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  } else if (yearFilterValue == 'Dec' &&
                      dataAtIndex.date.month == 12) {
                    return expenseTileWidget(
                        dataAtIndex.amount,
                        dataAtIndex.category,
                        dataAtIndex.date,
                        dataAtIndex.type,
                        index);
                  }
                }
                return Container();
              }
            } else {
              return Container();
            }
          }
        }));
  }

  expenseTileWidget(
      int value, String category, DateTime date, String edittype, int index) {
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
        ),
        SlidableAction(
          onPressed: (BuildContext context) {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return ScreenEditTransaction(
                amount: value,
                category: category,
                date: date,
                type: edittype,
                index: index,
              );
            }));
          },
          backgroundColor: const Color.fromARGB(255, 3, 161, 22),
          label: 'Edit',
          icon: Icons.edit,
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
        ),
        SlidableAction(
          onPressed: (BuildContext context) {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return ScreenEditTransaction(
                amount: value,
                category: category,
                date: date,
                type: edittype,
                index: index,
              );
            }));
          },
          backgroundColor: const Color.fromARGB(255, 3, 161, 22),
          label: 'Edit',
          icon: Icons.edit,
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
