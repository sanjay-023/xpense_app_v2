// import 'package:flutter/material.dart';

DateTime today = DateTime.now();
DateTime now = DateTime.now();
int monthIndex = 1;

// class SelectMonth extends StatefulWidget {
//   const SelectMonth({Key? key}) : super(key: key);

//   @override
//   State<SelectMonth> createState() => _SelectMonthState();
// }

// class _SelectMonthState extends State<SelectMonth> {
//   @override
//   Widget build(BuildContext context) {
//     //print(today);
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
//               monthIndex = 3;
//               today = DateTime(now.year, now.month - 2, today.day);
//             });
//           },
//           child: Container(
//             height: 35,
//             width: 100,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: monthIndex == 3
//                     ? const Color.fromARGB(255, 139, 9, 204)
//                     : const Color.fromARGB(255, 214, 213, 213)),
//             alignment: Alignment.center,
//             child: Text(
//               months[now.month - 3],
//               style: TextStyle(
//                   fontSize: 18,
//                   color: monthIndex == 3 ? Colors.white : Colors.black),
//             ),
//           ),
//         ),
//         InkWell(
//           onTap: () {
//             setState(() {
//               monthIndex = 2;
//               today = DateTime(now.year, now.month - 1, today.day);
//             });
//           },
//           child: Container(
//             height: 35,
//             width: 100,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: monthIndex == 2
//                     ? const Color.fromARGB(255, 139, 9, 204)
//                     : const Color.fromARGB(255, 214, 213, 213)),
//             alignment: Alignment.center,
//             child: Text(
//               months[now.month - 2],
//               style: TextStyle(
//                   fontSize: 18,
//                   color: monthIndex == 2 ? Colors.white : Colors.black),
//             ),
//           ),
//         ),
//         InkWell(
//           onTap: () {
//             setState(() {
//               monthIndex = 1;
//               today = DateTime.now();
//             });
//           },
//           child: Container(
//             height: 35,
//             width: 100,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: monthIndex == 1
//                     ? const Color.fromARGB(255, 139, 9, 204)
//                     : const Color.fromARGB(255, 214, 213, 213)),
//             alignment: Alignment.center,
//             child: Text(
//               months[now.month - 1],
//               style: TextStyle(
//                   fontSize: 18,
//                   color: monthIndex == 1 ? Colors.white : Colors.black),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
