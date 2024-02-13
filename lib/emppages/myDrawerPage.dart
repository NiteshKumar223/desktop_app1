// import 'package:bitsdojo_window/bitsdojo_window.dart';
// import 'package:desktop_app1/emppages/emppage_gate_pass.dart';
// import 'package:desktop_app1/emppages/emppage_my_home.dart';
// import 'package:flutter/material.dart';

// import '../utils/color.dart';

// class MyDrawerPage extends StatefulWidget {
//   const MyDrawerPage({super.key});

//   @override
//   State<MyDrawerPage> createState() => _MyDrawerPageState();
// }

// class _MyDrawerPageState extends State<MyDrawerPage> {
//   var selectedIndex = 0; // ! Add this property.
//   Color color = Color(0xff006633);

//   @override
//   Widget build(BuildContext context) {
//     Widget page;
//     switch (selectedIndex) {
//       case 0:
//         page = PageMyHome();
//         // Placeholder(
//         //   color: color,
//         //   child: Center(
//         //     child: Text("Dashboard"),
//         //   ),
//         // );
//         break;
//       case 1:
//         page = PageGatePass();
//         // Placeholder(
//         //   child: Center(
//         //     child: Text("Gate Pass"),
//         //   ),
//         // );
//         break;
//       case 2:
//         page = Placeholder(
//           child: Center(
//             child: Text("Gate Exit"),
//           ),
//         );
//         break;
//       case 3:
//         page = Placeholder(
//           child: Center(
//             child: Text('Daily info'),
//           ),
//         );
//         break;
//       case 4:
//         page = Placeholder(
//           child: Center(child: Text("Calculator")),
//         );
//         break;
//       case 5:
//         page = Placeholder(
//           child: Center(child: Text('Calender')),
//         );

//         break;
//       default:
//         throw UnimplementedError('no widget for $selectedIndex');
//     }

//   //  return  
//     //LayoutBuilder(builder: (context, constraints) {
//       return Row(
//         children: [
//           SafeArea(
//             child: Container(
//               height: 150,
//               width: 60,
//               color: AppColor.colorprimarylight,
//             ),
//           ),
//           SafeArea(
//             child: NavigationRail(
//               extended: false,
//               destinations: [
//                 NavigationRailDestination(
//                   icon: Icon(
//                     Icons.dashboard_rounded,
//                     color: color,
//                   ),
//                   label: Text('Dashboard'),
//                   padding: const EdgeInsets.only(bottom: 30, top: 30),
//                 ),
//                 NavigationRailDestination(
//                   icon: Icon(
//                     Icons.door_sliding_rounded,
//                     color: color,
//                   ),
//                   label: Text('Gate Pass'),
//                 ),
//                 NavigationRailDestination(
//                   icon: Icon(
//                     Icons.door_back_door,
//                     color: color,
//                   ),
//                   label: Text('Gate Exit'),
//                 ),
//                 NavigationRailDestination(
//                   icon: Icon(
//                     Icons.info_sharp,
//                     color: color,
//                   ),
//                   label: Text('Daily info'),
//                 ),
//                 NavigationRailDestination(
//                   icon: Icon(
//                     Icons.calculate,
//                     color: color,
//                   ),
//                   label: Text('Calculator'),
//                 ),
//                 NavigationRailDestination(
//                   icon: Icon(
//                     Icons.calendar_month_sharp,
//                     color: color,
//                   ),
//                   label: Text('Calender'),
//                 ),
//               ],
//               selectedIndex: selectedIndex, // <-- change to this.
//               onDestinationSelected: (value) {
//                 // print('selected: $value');  // And Replace print with this.
//                 setState(() {
//                   selectedIndex = value;
//                 });
//               },
//             ),
//           ),
//           Expanded(
//             child: Container(
//               color: Theme.of(context).colorScheme.primaryContainer,
//               child: page,
//             ),
//           ),
//         ],
//       );
//     }
//     //);
//   }
// //}
