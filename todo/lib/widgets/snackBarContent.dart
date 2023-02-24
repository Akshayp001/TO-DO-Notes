import 'package:flutter/material.dart';

class MySnackbarContent extends StatelessWidget {
  // const MySnackbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 80,
        width: double.infinity,
        // color: Colors.black,
      ),
      Positioned(
        top: 15,
        child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.cyan.shade300,
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(12)),
            child: Text(
              "Oops!! Seems That you've written Nothing!!",
              style: TextStyle(color: Colors.black, fontSize: 16),
            )),
      ),
      Positioned(
        left: 7,
        top: 5,
        // left: -10,
        child: Container(
          child: Center(
            child: Icon(
              Icons.question_mark,
              size: 17,
            ),
          ),
          height: 24,
          width: 24,
          decoration: BoxDecoration(
              color: Colors.red[300],
              border: Border.all(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ]);
  }
}
