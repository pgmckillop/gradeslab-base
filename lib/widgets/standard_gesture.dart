// import 'package:flutter/material.dart';
//
// class StandardGestureControl extends StatelessWidget {
//
//   final String buttonText;
//   final Function onTap;
//
//   StandardGestureControl({this.buttonText, this.onTap})
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:5.0,),
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 60.0),
//           alignment: Alignment.center,
//           height: 45.0,
//           decoration: BoxDecoration(
//             color: Theme.of(context).primaryColor,
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           child: Text(
//             buttonText,
//             style: TextStyle(
//               fontSize: 18.0,
//               color: Colors.white,
//               fontWeight: FontWeight.w600,
//               letterSpacing: 1.5,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget buildValidateSelectedProfile(Function onTap) => Padding(
//   padding: const EdgeInsets.symmetric(
//     horizontal: 20.0,
//     vertical: 5.0,
//   ),
//   child: GestureDetector(
//     onTap: onTap,
//     child: Container(
//       margin: EdgeInsets.symmetric(horizontal: 60.0),
//       alignment: Alignment.center,
//       height: 45.0,
//       decoration: BoxDecoration(
//         color: Theme.of(context).primaryColor,
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       child: Text(
//         'Can I get there?',
//         style: TextStyle(
//           fontSize: 18.0,
//           color: Colors.white,
//           fontWeight: FontWeight.w600,
//           letterSpacing: 1.5,
//         ),
//       ),
//     ),
//   ),
// );
//
// Widget buildStoreSelectedProfile() => Padding(
//   padding: const EdgeInsets.symmetric(
//     horizontal: 20.0,
//     vertical: 5.0,
//   ),
//   child: GestureDetector(
//     onTap: () {},
//     child: Container(
//       margin: EdgeInsets.symmetric(horizontal: 60.0),
//       alignment: Alignment.center,
//       height: 45.0,
//       decoration: BoxDecoration(
//         color: Theme.of(context).primaryColor,
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       child: Text(
//         'Set Profile as Target',
//         style: TextStyle(
//           fontSize: 18.0,
//           color: Colors.white,
//           fontWeight: FontWeight.w600,
//           letterSpacing: 1.5,
//         ),
//       ),
//     ),
//   ),
// );
