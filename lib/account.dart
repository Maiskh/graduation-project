import 'package:database/create.dart';
import 'package:database/info.dart';
import 'package:database/login.dart';
import 'package:database/manage_profile.dart';
import 'package:database/signup.dart';
import 'package:flutter/material.dart';

import 'contract.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
      dynamic dataList;

    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lobster',
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
                        fontFamily: 'Lobster',
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
                      fontFamily: 'Lobster',
                      fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                      color: Color.fromARGB(255, 5, 24, 40), Icons.assignment),
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
                      fontFamily: 'Lobster',
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
                      fontFamily: 'Lobster',
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
                      fontFamily: 'Lobster',
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
                      fontFamily: 'Lobster',
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
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
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
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileScreen(),
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
                      fontFamily: 'Lobster',
                      fontSize: 15),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                 
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    height: height * 0.43,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.72,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color.fromARGB(255, 5, 24, 40),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                    ),
                                    Text(
                                      'User Name',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Lobster',
                                        fontSize: 37,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Contracts',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Lobster',
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              '0',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Lobster',
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                       
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                           
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundImage: AssetImage('images/i.png'),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: IconButton(
                                color: Colors.white,
                                iconSize: 30,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => create(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.add_a_photo_outlined),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 110,
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

                 
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
