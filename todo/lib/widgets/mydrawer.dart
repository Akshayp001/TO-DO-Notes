// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MyDrawer extends StatelessWidget {
//   // final String name;

//   // const MyDrawer({Key? key, required this.name}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: <Widget>[
//           UserAccountsDrawerHeader(
//             accountName: Text("name"),
//             currentAccountPicture: CircleAvatar(
//               child: Icon(Icons.person),
//               backgroundColor: Colors.white,
//             ),
//           ),
//           Expanded(
//             child: SizedBox(),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               IconButton(
//                 icon: Image.asset(
//                   'assets/images/linkedin.png',
//                   width: 60,
//                   height: 60,
//                 ),
//                 onPressed: () async {
//                   const url = 'https://www.linkedin.com/';
//                   if (await canLaunch(url)) {
//                     await launch(url);
//                   } else {
//                     throw 'Could not launch $url';
//                   }
//                 },
//               ),
//               IconButton(
//                 icon: Image.asset(
//                   'assets/images/github.png',
//                   width: 60,
//                   height: 60,
//                 ),
//                 onPressed: () async {
//                   const url = 'https://github.com/';
//                   if (await canLaunch(url)) {
//                     await launch(url);
//                   } else {
//                     throw 'Could not launch $url';
//                   }
//                 },
//               ),
//               IconButton(
//                 icon: Image.asset(
//                   'assets/images/instagram.png',
//                   width: 60,
//                   height: 60,
//                 ),
//                 onPressed: () async {
//                   const url = 'https://www.instagram.com/';
//                   if (await canLaunch(url)) {
//                     await launch(url);
//                   } else {
//                     throw 'Could not launch $url';
//                   }
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  // final String name;

  // const MyDrawer({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height * 0.225,
                  color: Colors.blue),
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://picsum.photos/500/500',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: MediaQuery.of(context).size.width * 0.25,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.red,
                  child: CircleAvatar(
                      radius: 48,
                      child: Image.asset(
                        'assets/images/user.png',
                        fit: BoxFit.cover,
                      )),
                  // child: Icon(
                  //   Icons.person,
                  //   size: 50,
                  // ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 300,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Image.asset(
                  'assets/images/linkedin.png',
                  width: 60,
                  height: 60,
                ),
                onPressed: () async {
                  const url = 'https://www.linkedin.com/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              IconButton(
                icon: Image.asset(
                  'assets/images/github.png',
                  width: 60,
                  height: 60,
                ),
                onPressed: () async {
                  const url = 'https://github.com/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
              IconButton(
                icon: Image.asset(
                  'assets/images/instagram.png',
                  width: 60,
                  height: 60,
                ),
                onPressed: () async {
                  const url = 'https://www.instagram.com/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
