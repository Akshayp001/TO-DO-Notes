import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/data/dataBase.dart';
import 'package:todo/modal/modalInfo.dart';
import 'package:todo/pages/notesPage.dart';
import 'package:todo/widgets/gridTile.dart';
import '../widgets/mydrawer.dart';
import '../widgets/snackBarContent.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box("NotesData1");
  // List<ModalInfo> db.notesList;
  DataBase db = DataBase();

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

  @override
  void initState() {
    // TODO: implement initState

    // first time opening
    if (_mybox.get("NotesData1") == null) {
      db.createInitialData();
      db.updateData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MyDrawer(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // leading: Builder(
        //   builder: (context) {
        //     return IconButton(
        //       icon: Icon(
        //         Icons.menu_rounded,
        //         color: Colors.white,
        //       ),
        //       onPressed: () => Scaffold.of(context).openDrawer(),
        //     );
        //   }
        // ),
        foregroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.red, Colors.pink, Colors.orange])),
        ),
        centerTitle: true,
        title: Text(
          "MY NOTES",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NotesPage(
                        isEdit: false,
                      )));
            });
          },
          child: Icon(Icons.add)),
      body: Container(
          padding: EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topRight,
                  colors: [
                Colors.black54,
                Colors.grey.shade600,
                Colors.white,
                Colors.grey.shade600,
                Colors.black54
              ])),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 5,
              childAspectRatio: 0.6,
            ),
            itemCount: db.notesList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  // splashColor: Colors.red,

                  onTap: () {
                    setState(() {
                      // db.notesList[index].titleText = "Clicked";
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NotesPage(
                                isEdit: true,
                                index: index,
                              )));
                    });
                  },
                  child: Stack(children: [
                    Gridtile(
                        notesList: db.notesList, index: index, ctx: context),
                    Positioned(
                      top: 16,
                      left: 11,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            db.notesList.removeAt(index);
                            db.updateData();
                            db.loadData();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                content: MySnackbarContent(
                                  snackBarText: "Note Deleted successfully",
                                  snackBarColor: Colors.red,
                                  snackBarIcon: Icon(
                                    Icons.delete,
                                    size: 17,
                                  ),
                                )));
                          });
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.delete,
                              size: 20,
                              color: Colors.white70,
                            ),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  ]));
            },
          )),
    );
  }
}
