import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/pic.dart';
import 'package:flutter/material.dart';

import 'account.dart';
import 'contract.dart';
import 'create.dart';
import 'data.dart';
import 'info.dart';
import 'login.dart';
import 'manage_profile.dart';

class Prof extends StatefulWidget {
  const Prof({Key? key}) : super(key: key);

  @override
  _ProfState createState() => _ProfState();
}

class _ProfState extends State<Prof> {
  List dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              // fontFamily: 'Lobster',
              fontSize: 20),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => contract(),
                ),
              );
            },
            icon: Icon(Icons.assignment),
          ),
        ],
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 5, 24, 40),
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            Title(
                color: Color.fromARGB(255, 5, 24, 40),
                child: Text(
                  '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 5, 24, 40),
                      fontSize: 15),
                )),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                color: Color.fromARGB(255, 5, 24, 40),
                Icons.account_box_rounded,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => manage_profile(),
                  ),
                );
              },
            ),
            Text(' Manage account ',
                style: TextStyle(
                    color: Color.fromARGB(255, 5, 24, 40),
                    fontWeight: FontWeight.w500,
                    // fontFamily: 'Lobster',
                    fontSize: 15)),
            SizedBox(
              height: 20,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              //alignment: Alignment.bottomLeft,
              icon: Icon(
                color: Color.fromARGB(255, 5, 24, 40),
                Icons.notifications,
              ),
              onPressed: () {},
            ),
            Text(
              'notifications',
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 24, 40),
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Lobster',
                  fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon:
                  Icon(color: Color.fromARGB(255, 5, 24, 40), Icons.assignment),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => contract(),
                  ),
                );
              },
            ),
            Text(
              'Your contract',
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 24, 40),
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Lobster',
                  fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                color: Color.fromARGB(255, 5, 24, 40),
                Icons.help,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => info(),
                  ),
                );
              },
            ),
            Text(
              'Info',
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 24, 40),
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Lobster',
                  fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            IconButton(
              color: Color.fromARGB(255, 5, 24, 40),
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.wysiwyg_sharp,
              ),
              onPressed: () {},
            ),
            Text(
              'Signature',
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 24, 40),
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Lobster',
                  fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            IconButton(
              color: Color.fromARGB(255, 5, 24, 40),
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.settings,
              ),
              onPressed: () {},
            ),
            Text(
              'Setting',
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 24, 40),
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Lobster',
                  fontSize: 15),
            ),
            SizedBox(
              height: 50,
            ),
            IconButton(
              color: Color.fromARGB(255, 5, 24, 40),
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.logout,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text("Exit"),
                      content: new Text(" Do you want to Logout?"),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 5, 24, 40),
                          ),
                          child: new Text(
                            "Yes",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 5, 24, 40),
                          ),
                          child: new Text(
                            "No",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Prof(),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Text(
              'Exit',
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 24, 40),
                  fontWeight: FontWeight.w500,
                  // fontFamily: 'Lobster',
                  fontSize: 15),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: FireStoreDataBase().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            dataList = snapshot.data;
            return buildItems(dataList);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildItems(dataList) => ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: [dataList].length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(children: [
                Container(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('images/i.png'),
                  child: Container(
                     alignment: Alignment.bottomRight,
 
                        child: IconButton(
                            color: Color.fromARGB(255, 5, 24, 40),
                            iconSize: 30,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => picscreen(),
                                ),
                              );
                            },
                            icon: Icon(Icons.add_a_photo_outlined))),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  dataList[0]["first-name"].toString() +
                      "  " +
                      dataList[0]["last-name"].toString(),
                  style: TextStyle(
                    color: Color.fromARGB(255, 5, 24, 40),
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'Lobster',

                    fontSize: 37,
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  child: IconButton(
                    color: Color.fromARGB(255, 5, 24, 40),
                    iconSize: 60,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => create(),
                        ),
                      );
                    },
                    icon: Icon(Icons.add_circle),
                  ),
                ),
              ])),

          // title: Text(dataList[0]["last-name"].toString()),
          // subtitle: Text(dataList[0]["first-name"].toString()),
          // trailing: Text(dataList[0]["gender"],
          // ),
        );
      });
}
