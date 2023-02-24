import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/modal/modalInfo.dart';

class temp extends StatelessWidget {
  Box newB = Hive.box("temp");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sdfg"),
      ),
      body: Container(
        child: Column(children: [
          MaterialButton(
            onPressed: () {
              newB.put(10, [ModalInfo(content: "1c", titleText: " 1t"),ModalInfo(content: "2c", titleText: " 2t"),ModalInfo(content: "3c", titleText: " 3t")]);
            },
            child: Text("Send"),
          ),
          MaterialButton(
            onPressed: () {
              var tempp = newB.get(10);
              print(tempp[0].content);
            },
            child: Text("Receive"),
          ),
        ]),
      ),
    );
  }
}
