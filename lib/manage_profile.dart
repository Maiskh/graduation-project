import 'package:database/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'create.dart';
import 'data.dart';

class manage_profile extends StatefulWidget {
  const manage_profile({super.key});

  @override
  State<manage_profile> createState() => _manage_profileState();
}

class _manage_profileState extends State<manage_profile> {
  List dataList1 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acount Data'),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Prof(),
                ),
              );
            },
            icon: Icon(Icons.keyboard_backspace),
          ),
        ],
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 5, 24, 40),
      ),
      body: FutureBuilder(
        future: FireStoreDataBase2().getData2(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            dataList1 = snapshot.data;
            return buildItems(dataList1);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

Widget buildItems(datalist1) => ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: [datalist1].length,
    separatorBuilder: (BuildContext context, int index) => const Divider(),
    itemBuilder: (BuildContext context, int index) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage("images/90.jpg"), fit: BoxFit.cover),
        ),

        child: Padding(
            padding: const EdgeInsets.only(top: 220),
            child: Container(
              child: Text(
                ' User Name :' +
                    datalist1[0]["first-name"].toString() +
                    " " +
                    datalist1[0]["last-name"].toString() +
                    "\n \n Gender : " +
                    datalist1[0]["gender"] +
                    "\n \n Birthday : " +
                    datalist1[0]["birth-day"].toString() +
                    '\n \n Type of user : ' +
                    datalist1[0]["type"] +
                    '\n \n Country : ' +
                    datalist1[0]["country"] +
                    "\n \n Natunality : " +
                    datalist1[0]["nationality"],
                style: TextStyle(
                  color: Color.fromARGB(255, 5, 24, 40),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            )),

        // title: Text(dataList[0]["last-name"].toString()),
        // subtitle: Text(dataList[0]["first-name"].toString()),
        // trailing: Text(dataList[0]["gender"],
        // ),
      );
    });
