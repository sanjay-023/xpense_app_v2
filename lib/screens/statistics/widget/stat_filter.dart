// import 'package:flutter/material.dart';



// class StatFilter extends StatefulWidget {
//   const StatFilter({Key? key}) : super(key: key);

//   @override
//   State<StatFilter> createState() => _StatFilterState();
// }

// class _StatFilterState extends State<StatFilter> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         InkWell(
//           onTap: () {
//             setState(() {
//               statIndex = 1;
//             });
//           },
//           child: Container(
//             width: 100,
//             height: 35,
//             decoration: BoxDecoration(
//                 color: statIndex == 1
//                     ? const Color.fromARGB(255, 139, 9, 204)
//                     : const Color.fromARGB(255, 186, 185, 185),
//                 borderRadius: BorderRadius.circular(20)),
//             child: Center(
//                 child: Text(
//               'This Month',
//               style: TextStyle(
//                   color: statIndex == 1
//                       ? Colors.white
//                       : const Color.fromARGB(255, 99, 98, 98)),
//             )),
//           ),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         InkWell(
//           onTap: () {
//             setState(() {
//               statIndex = 2;
//             });
//           },
//           child: Container(
//             width: 100,
//             height: 35,
//             decoration: BoxDecoration(
//                 color: statIndex == 2
//                     ? const Color.fromARGB(255, 139, 9, 204)
//                     : const Color.fromARGB(255, 186, 185, 185),
//                 borderRadius: BorderRadius.circular(20)),
//             child: Center(
//                 child: Text(
//               'This Year',
//               style: TextStyle(
//                   color: statIndex == 2
//                       ? Colors.white
//                       : const Color.fromARGB(255, 99, 98, 98)),
//             )),
//           ),
//         ),
//       ],
//     );
//   }
// }
