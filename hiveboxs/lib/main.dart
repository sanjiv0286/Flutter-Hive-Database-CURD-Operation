import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hiveboxs/Models/notes_model.dart';
import 'package:hiveboxs/home_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // intialization  of Hive with a box
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  // register adapter and open a box
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>('notes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Hive Database Curd Operation',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const HomeScreen());
  }
}
// ***********************************************************
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hiveboxs/Models/notes_model.dart';
// import 'package:path_provider/path_provider.dart';

// void main() async {
  // // intialization  of Hive with a box
//   WidgetsFlutterBinding.ensureInitialized();
//   var directory = await getApplicationDocumentsDirectory();
//   Hive.init(directory.path);
//   // register adapter and open a box
//   Hive.registerAdapter(NotesModelAdapter());
//   await Hive.openBox<NotesModel>('notes');
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.deepPurpleAccent,
//           title: const Center(
//             child: Text(
//               "Hive Database",
//               style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             FutureBuilder(
//               future: Hive.openBox('myBox'),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     // Display a loading indicator while waiting for the box to open
//                     child: Center(child: CircularProgressIndicator()),
//                   );
//                 } else if (snapshot.hasError) {
//                   return Center(
//                     child: Text(
//                         // Display an error message if opening the box fails
//                         'Error: ${snapshot.error}'),
//                   );
//                 } else {
//                   // Once the box is opened successfully, display the data
//                   var box = Hive.box('myBox');
//                   var name = box.get('name', defaultValue: '');
//                   var age = box.get('age', defaultValue: '');
//                   var list = box.get('list', defaultValue: {});
//                   return ListTile(
//                     tileColor: const Color.fromARGB(164, 172, 180, 194),
//                     title: Text('Name: $name'),
//                     subtitle: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Age: $age'),
//                         Text('List: $list'),
//                         Text('Pro in: ${list['pro']}'),
//                       ],
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             //You can use Hive just like a map. It is not necessary to await  Futures.
//             var box = await Hive.openBox('myBox');

//             box.put('name', 'Sanjiv Kushwaha');
//             var name = box.get('name');

// // ignore_for_file: use_build_context_synchronously

//             box.put('age', '21');
//             var age = box.get('age');
//             box.put('list', {'pro': 'developer', 'con': 'designer'});
//             var list = box.get('list');
//             stdout.write('Name: $name\n');
//             stdout.write('Age: $age\n');
//             stdout.write('List: $list\n');
//             stdout.write('${list['pro']}');
//           },
//           child: const Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }

