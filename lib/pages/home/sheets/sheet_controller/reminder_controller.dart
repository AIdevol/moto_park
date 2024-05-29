// import 'package:flutter/material.dart';
// import 'package:moto_park/utilities/google_font_text_style.dart';
// import 'package:moto_park/utilities/helper_widget.dart';

// Widget _buildExpandableContainer({
//     required String title,
//     required String subtitle,
//     required String message,
//     required bool expanded,
//     required VoidCallback onPressed,
//   }) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         height: expanded ? 200 : 100,
//         width: 360,
//         decoration: BoxDecoration(
//           color: Colors.white70,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 0.7,
//               blurRadius: 0.5,
//               offset: const Offset(0, 3),
//             ),
//           ],
//           borderRadius: BorderRadius.circular(25),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
//                 child: Container(
//                   height: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   child: ListView(
//                     children: [
//                       Text(
//                         title,
//                         style:
//                             BalooStyles.balooboldTextStyle(color: Colors.black),
//                         textAlign: TextAlign.start,
//                       ),
//                       vGap(5),
//                       Text(
//                         subtitle,
//                         style:
//                             BalooStyles.balooboldTextStyle(color: Colors.grey),
//                         textAlign: TextAlign.start,
//                       ),
//                       vGap(30),
//                       Text(
//                         message,
//                         style: BalooStyles.balooboldTextStyle(
//                             color: Colors.black87),
//                         textAlign: TextAlign.start,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Visibility(
//                 visible: expanded,
//                 child: IconButton(
//                   icon: Icon(
//                     expanded
//                         ? Icons.keyboard_arrow_up
//                         : Icons.keyboard_arrow_down,
//                   ),
//                   onPressed: onPressed,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

