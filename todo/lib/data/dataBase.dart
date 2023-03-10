import 'package:hive_flutter/hive_flutter.dart';

import '../modal/modalInfo.dart';
import 'package:flutter/material.dart';

List<Color> colors = [
  Colors.red[300],
  Colors.green[300],
  Colors.orange[300],
  Colors.purple[300],
  Colors.amber[300],
  Colors.black54,
  Colors.blue[300],
  Colors.yellowAccent,
  Colors.pink[300],
  Colors.lightGreen[300],
  Color.fromARGB(255, 28, 184, 114),
  Colors.white,
];

class DataBase {
  final _mybox = Hive.box("NotesData1");
  List<ModalInfo> notesList;

  void createInitialData() {
    notesList = <ModalInfo>[ModalInfo(content: "Welcome To Notes App",titleText: "Welcome",datetimeInfo: DateTime.now())];
  }

  void loadData() {
    notesList = _mybox.get("NotesData1").cast<ModalInfo>();
  }

  void updateData() {
    _mybox.put("NotesData1", notesList);
  }
}
