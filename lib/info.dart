import 'package:database/account.dart';
import 'package:flutter/material.dart';

class info extends StatelessWidget {
  const info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Information",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Lobster',
              fontSize: 20),
        ),
        leading: IconButton(
          color: Color.fromARGB(255, 5, 24, 40),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 5, 24, 40),
      ),
              backgroundColor: Colors.white,

      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //       image: ExactAssetImage("images/16.jpg"), fit: BoxFit.cover),
        // ),
        child: Text(
          'In this application,\n We will give you an opportunity to experience the work of contracts electronically in a safer and easier way... ',
          style: TextStyle(
              color: Color.fromARGB(255, 5, 24, 40),
              fontWeight: FontWeight.w500,
              fontFamily: 'Lobster',
              fontSize: 40),
        ),
      ),
    );
  }
}
