import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/data/dataBase.dart';
import 'package:todo/modal/modalInfo.dart';
import 'package:todo/pages/homePage.dart';
import 'package:todo/widgets/snackBarContent.dart';

class NotesPage extends StatefulWidget {
  int index;
  bool isEdit;

  NotesPage({Key myKey, this.index, this.isEdit}) : super(key: myKey);
  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Color> colors = [
    Colors.red[300],
    Colors.green[300],
    Colors.orange[300],
    Colors.purple[300],
    Colors.amber[300],
    Colors.blue[300],
    Colors.yellowAccent,
    Colors.pink[300],
    Colors.lightGreen[300],
    Color.fromARGB(255, 28, 184, 114),
    // Colors.white,
  ];
  String appBarText;
  String ContentText;
  DataBase db = DataBase();

  final titleController = TextEditingController();
  final contentController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialiseNotes();
  }

  initialiseNotes() {
    db.loadData();

    if (widget.isEdit) {
      appBarText = db.notesList[widget.index].titleText;
      titleController.text = db.notesList[widget.index].titleText;
      contentController.text = db.notesList[widget.index].content;
    } else {
      titleController.clear();
      contentController.clear();
      appBarText = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.red, Colors.amber])),
        ),
        title: Text(
          appBarText,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                if (titleController.text == "" &&
                    contentController.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      content: MySnackbarContent(
                        snackBarText:
                            "Oops!! Seems That you've written Nothing!!",
                        snackBarColor: Colors.cyan.shade300,
                        snackBarIcon: Icon(
                          Icons.question_mark,
                          size: 17,
                        ),
                      )));
                } else if (widget.isEdit) {
                  db.loadData();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      content: MySnackbarContent(
                        
                        snackBarText: "Changes saved successfully",
                        snackBarColor: Colors.pink.shade300,
                        snackBarIcon: Icon(
                          Icons.done,
                          size: 17,
                        ),
                      )));
                  db.notesList[widget.index] = ModalInfo(
                    content: contentController.text,
                    titleText: titleController.text,
                    datetimeInfo: db.notesList[widget.index].datetimeInfo,
                  );
                  db.updateData();
                  Navigator.of(context).pop();
                } else {
                  db.loadData();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      content: MySnackbarContent(
                        snackBarText: "Note added successfully",
                        snackBarColor: Colors.orange.shade300,
                        snackBarIcon: Icon(
                          Icons.done,
                          size: 17,
                        ),
                      )));
                  db.notesList.add(ModalInfo(
                      content: contentController.text,
                      titleText: titleController.text,
                      datetimeInfo: DateTime.now()));
                  db.updateData();
                  Navigator.of(context).pop();
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
            color: Colors.orange.shade200,
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Colors.orange[200], Colors.yellow[100]]),
                    borderRadius: BorderRadius.circular(12)),
                child: TextFormField(
                  // Title Text Field
                  
                  controller: titleController,
                  onChanged: (value) {
                    setState(() {
                      appBarText = value;
                    });
                  },
                  decoration: InputDecoration(hintText: "Title Here...."),
                  style: TextStyle(fontSize: 20),
                  maxLength: 30,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Colors.orange[300], Colors.yellow[100]]),
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  // content Field

                  controller: contentController,
                  decoration: InputDecoration(hintText: "Type something..."),
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  onChanged: (Contentvalue) {
                    setState(() {
                      ContentText = Contentvalue;
                    });
                  },
                  maxLines: 200,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
