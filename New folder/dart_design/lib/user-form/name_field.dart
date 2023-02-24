import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class namefield extends StatefulWidget {
  const namefield({super.key});

  @override
  State<namefield> createState() => _namefieldState();
}

class _namefieldState extends State<namefield> {
  String name = "";
  List<Map<String, dynamic>> data = [
    {
      'name': 'Sunamegong',
    },
    {
      'name': 'Guaingat',
    },
    {
      'name': 'Taherpur',
    },
    {
      'name': 'Shalla',
    },
    {
      'name': 'Tahirpur',
    },
    {
      'name': 'Dirai',
    },
    {
      'name': 'Chattak',
    },
    {
      'name': 'Jaintapur',
    },
    {
      'name': 'Kanaigat',
    },
    {
      'name': 'Balagang',
    },
    {
      'name': 'Duarabazar',
    },
  ];

  addData() async {
    for (var elenment in data) {
      FirebaseFirestore.instance.collection('user').add(elenment);
    }
    print('all data added');
  }

  @override
  void iniState() {
    super.initState();
    addData();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Card(
          // ignore: prefer_const_constructors
          child: TextField(
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  // ignore: prefer_const_constructors
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search'),
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              }),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("user").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              // ignore: prefer_const_constructors
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;

                    if (name.isEmpty) {
                      return ListTile(
                          title: Text(
                            data['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          // ignore: prefer_const_constructors
                          leading: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 120, 138, 241),
                            radius: 30,
                          ));
                    }
                    if (data['name']
                        .toString()
                        .toLowerCase()
                        .startsWith(name.toLowerCase())) {
                      return ListTile(
                          title: Text(
                            data['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          // ignore: prefer_const_constructors
                          leading: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 120, 138, 241),
                            radius: 30,
                          ));
                    }
                    return Container();
                  },
                );
        },
      ),
    );
  }
}
