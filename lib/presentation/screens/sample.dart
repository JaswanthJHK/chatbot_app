// import 'package:flutter/material.dart';

// class SampleListView extends StatefulWidget {
//   const SampleListView({super.key});

//   @override
//   State<SampleListView> createState() => _SampleListViewState();
// }

// class _SampleListViewState extends State<SampleListView> {
//   List<String> sampleData = ["Jaswanth", "Abhi", "Nandu", "Gargi", "Hentai"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         padding: EdgeInsets.all(8),
//         itemCount: sampleData.length,
//         itemBuilder: (context, index) {
//           return SampleContainer(sampleData: sampleData[index]);
//         },
//       ),
//     );
//   }
// }

// class SampleContainer extends StatelessWidget {
//   const SampleContainer({
//     super.key,
//     required this.sampleData,
//   });

//   final String sampleData;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: double.infinity,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: Text(sampleData),
//         ),
//       ),
//     );
//   }
// // }
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Bottom Sheet Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Show bottom sheet when the screen is loaded
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _showBottomSheet();
//     });
//   }

//   void _showBottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           child: Container(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Search',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Screen'),
//       ),
//       body: Center(
//         child: Text('Welcome to Flutter Bottom Sheet Demo'),
//       ),
//     );
//   }
// }
