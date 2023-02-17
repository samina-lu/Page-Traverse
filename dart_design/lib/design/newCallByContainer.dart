import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// import '../views/copy-main.dart';

class SchoolWithData extends StatefulWidget {
  SchoolWithData({super.key});

  @override
  _SchoolWithDataState createState() => _SchoolWithDataState();
}

class _SchoolWithDataState extends State<SchoolWithData> {
  List st = [
    " school name :  abc \n  water:100L\n  population: 100\n  Distance:100\n  shame: nai ",
    " school name :  a9c \n  water:150L\n  population: 400\n  Distance:100\n  shame: nai ",
  ];
  var clr = [
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.blueGrey,
    Color.fromARGB(255, 187, 42, 66),
    Colors.green,
  ];

  var dataRecive = "bongsong";
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: Icon(Icons.exit_to_app))
        ],
        title: Text("Sylhet Division"),
        backgroundColor: Color.fromARGB(255, 71, 233, 248),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            // ignore: unnecessary_new
            Container(
              height: 150,
              color: Colors.black,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                GestureDetector(
                  child: Container(
                    height: 100,
                    width: 250,
                    color: Colors.green[300],
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                            height: 100,
                            width: 500,
                            child: Image.asset(
                              "assets/o.jpg",
                            )),
                        Text("first Image "),
                        Text("first Image "),
                        Text("first Image "),
                        Text("first Image "),
                        Text("first Image "),
                      ]),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      dataRecive = st[0];
                      index = 1;
                    });
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 100,
                    width: 250,
                    color: Color.fromARGB(255, 8, 24, 163),
                  ),
                  onTap: () {
                    setState(() {
                      dataRecive = st[1];
                      index = 2;
                    });
                  },
                ),
                // Container(
                //   height: 80,
                //   width: 150,
                //   color: Color.fromARGB(255, 243, 185, 147),
                // ),
                // Container(
                //   height: 80,
                //   width: 80,
                //   color: Color.fromARGB(255, 126, 202, 207),
                // ),
                // Container(
                //   height: 80,
                //   width: 80,
                //   color: Color.fromARGB(255, 95, 100, 129),
                // ),
              ]),
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              height: 200,
              width: 350,
              color: clr[index],
              child: Center(
                child: Text(
                  " ${dataRecive}",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
