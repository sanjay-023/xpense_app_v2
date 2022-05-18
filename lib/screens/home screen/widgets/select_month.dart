// import 'package:flutter/material.dart';

// DateTime today = DateTime.now();
// DateTime now = DateTime.now();

// class SelectMonth extends StatefulWidget {
//   SelectMonth({Key? key}) : super(key: key);
//   int index = 1;

//   @override
//   State<SelectMonth> createState() => _SelectMonthState();
// }

// class _SelectMonthState extends State<SelectMonth> {
//   @override
//   Widget build(BuildContext context) {
//     List<String> months = [
//       "Jan",
//       "Feb",
//       "Mar",
//       "Apr",
//       "May",
//       "Jun",
//       "Jul",
//       "Aug",
//       "Sep",
//       "Oct",
//       "Nov",
//       "Dec"
//     ];
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         InkWell(
//           onTap: () {
//             setState(() {
//               widget.index = 3;
//               today = DateTime(now.year, now.month - 2, today.day);
//             });
//           },
//           child: Container(
//             height: 35,
//             width: 100,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: widget.index == 3
//                     ? const Color.fromARGB(255, 139, 9, 204)
//                     : const Color.fromARGB(255, 214, 213, 213)),
//             alignment: Alignment.center,
//             child: Text(
//               months[now.month - 3],
//               style: TextStyle(
//                   fontSize: 18,
//                   color: widget.index == 3 ? Colors.white : Colors.black),
//             ),
//           ),
//         ),
//         InkWell(
//           onTap: () {
//             setState(() {
//               widget.index = 2;
//               today = DateTime(now.year, now.month - 1, today.day);
//             });
//           },
//           child: Container(
//             height: 35,
//             width: 100,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: widget.index == 2
//                     ? const Color.fromARGB(255, 139, 9, 204)
//                     : const Color.fromARGB(255, 214, 213, 213)),
//             alignment: Alignment.center,
//             child: Text(
//               months[now.month - 2],
//               style: TextStyle(
//                   fontSize: 18,
//                   color: widget.index == 2 ? Colors.white : Colors.black),
//             ),
//           ),
//         ),
//         InkWell(
//           onTap: () {
//             setState(() {
//               widget.index = 1;
//               today = DateTime.now();
//             });
//           },
//           child: Container(
//             height: 35,
//             width: 100,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: widget.index == 1
//                     ? const Color.fromARGB(255, 139, 9, 204)
//                     : const Color.fromARGB(255, 214, 213, 213)),
//             alignment: Alignment.center,
//             child: Text(
//               months[now.month - 1],
//               style: TextStyle(
//                   fontSize: 18,
//                   color: widget.index == 1 ? Colors.white : Colors.black),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
