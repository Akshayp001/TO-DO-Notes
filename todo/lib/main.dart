import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/pages/notesPage.dart';
import 'modal/modalInfo.dart';
import 'pages/homePage.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ModalInfoAdapter());
  var myBox = await Hive.openBox("NotesData1");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          accentColor: Colors.amber,
          textTheme: TextTheme(
              // subtitle1: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),
              titleMedium: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          appBarTheme: AppBarTheme(
              brightness: Brightness.dark,
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  color: Colors.red[800],
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      // home: temp(),
      home: HomePage(),
      // home: NotesPage(),
    );
  }
}
