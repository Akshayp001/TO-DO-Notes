import 'package:flutter/material.dart';
import 'package:todo/modal/modalInfo.dart';

class Gridtile extends StatelessWidget {
  // const Gridtile({Key key}) : super(key: key);
  List<ModalInfo> notesList;
  // Function deleteTile;
  BuildContext ctx;
  int index;

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

  Gridtile(
      {@required this.notesList, @required this.index, @required this.ctx});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: MediaQuery.of(ctx).size.height * 0.55,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      color: colors[index % colors.length],
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            colors[index % colors.length],
                            Color.fromARGB(185, 198, 75, 18)
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          notesList[index].titleText,
                          style: Theme.of(ctx).textTheme.titleMedium,
                        )),
                        Text(
                          "${notesList[index].datetimeInfo.day}-${notesList[index].datetimeInfo.month}-${notesList[index].datetimeInfo.year}",
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 242,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      // color: colors[index % colors.length],
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            colors[index % colors.length],
                            Color.fromARGB(195, 190, 39, 100)
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      notesList[index].content,
                      style: TextStyle(fontSize: 15),
                      softWrap: true,
                    ),
                  ),
                ),
              ]),
          decoration: BoxDecoration(
              color: Colors.red[200],
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: Colors.black, width: 3)),
        );
  }
}
