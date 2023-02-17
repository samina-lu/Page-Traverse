import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class shelter extends StatefulWidget {
  const shelter({super.key});

  @override
  State<shelter> createState() => _shelterState();
}

class _shelterState extends State<shelter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.extent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 5,
          crossAxisSpacing: 8,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/R.jpg"),
                      Text(
                        "asfdasdfasf",
                        style: TextStyle(fontSize: 20),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(children: [
                  Image.asset("assets/R.jpg"),
                  Text(
                    "Neymar 2",
                    style: TextStyle(fontSize: 20),
                  )
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(children: [
                  Image.asset("assets/R.jpg"),
                  Text(
                    "Neymar 3",
                    style: TextStyle(fontSize: 20),
                  )
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(children: [
                  Image.asset("assets/R.jpg"),
                  Text(
                    "Neymar 4",
                    style: TextStyle(fontSize: 20),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
