import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'account.dart';
import 'contract.dart';

class create extends StatefulWidget {
  const create({super.key});

  @override
  State<create> createState() => _createState();
}

class _createState extends State<create> {
  String selectedType = "Sale";
  TextEditingController dateController = TextEditingController();
  TextEditingController clientname = TextEditingController();
  TextEditingController contractdate = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController otherpartie = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController typeofitem = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    clientname.dispose();
    contractdate.dispose();
    duration.dispose();
    otherpartie.dispose();
    price.dispose();
    typeofitem.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create your contract",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              // fontFamily: 'Lobster',
              fontSize: 20),
        ),
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Prof(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 5, 24, 40),
      ),
      body: Container(
       decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage("images/70.jpg"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
            Padding(padding: EdgeInsets.all(135)),
            // Container(
            //   child: Text(
            //     '  Create contract ',
            //     style: TextStyle(
            //         color: Color.fromARGB(255, 5, 24, 40),
            //         fontWeight: FontWeight.w500,
            //         // fontFamily: 'Lobster',
            //         fontSize: 20),
            //   ),
            // ),
            Container(
              
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Client name  ",
                style: TextStyle(
                    color: Color.fromARGB(255, 5, 24, 40),
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    // fontFamily: "Lobster",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              alignment: Alignment.centerLeft,
              height: 60,
              child: TextField(
                controller: clientname,
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 5, 24, 40))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 5, 24, 40))),
                  hintText: 'Client name',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 5, 24, 40)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Other partie name",
                style: TextStyle(
                    color: Color.fromARGB(255, 5, 24, 40),
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    // fontFamily: "Lobster",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              alignment: Alignment.centerLeft,
              height: 60,
              child: TextField(
                controller: otherpartie,
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 5, 24, 40))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 5, 24, 40))),
                  hintText: 'Other partie name',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 5, 24, 40)),
                ),
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.all(15),
            //   alignment: Alignment.bottomLeft,
            //   child: Text(
            //     "ID Number for other Partie ",
            //     style: TextStyle(
            //         color: Color.fromARGB(255, 5, 24, 40),
            //         fontSize: 20,
            //         fontStyle: FontStyle.normal,
            //         fontFamily: "Lobster",
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 10.0),
            //   alignment: Alignment.centerLeft,
            //   height: 60,
            //   child: TextField(
            //     controller: ,
            //     keyboardType: TextInputType.name,
            //     style: TextStyle(color: Colors.black87),
            //     decoration: InputDecoration(
            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(50.0)),
            //           borderSide:
            //               BorderSide(color: Color.fromARGB(255, 5, 24, 40))),
            //       focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(50.0)),
            //           borderSide:
            //               BorderSide(color: Color.fromARGB(255, 5, 24, 40))),
            //       hintText: 'ID Number',
            //       hintStyle: TextStyle(color: Color.fromARGB(255, 5, 24, 40)),
            //     ),
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Type of Item ",
                style: TextStyle(
                    color: Color.fromARGB(255, 5, 24, 40),
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    // fontFamily: "Lobster",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              alignment: Alignment.centerLeft,
              height: 60,
              child: TextField(
                controller: typeofitem,
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 5, 24, 40))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 5, 24, 40))),
                  hintText: 'Type of Item',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 5, 24, 40)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Add price ",
                style: TextStyle(
                    color: Color.fromARGB(255, 5, 24, 40),
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    // fontFamily: "Lobster",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              alignment: Alignment.centerLeft,
              height: 60,
              child: TextField(
                controller: price,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 5, 24, 40))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 5, 24, 40))),
                  hintText: 'Add price',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 5, 24, 40)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Duration of the contract ",
                style: TextStyle(
                    color: Color.fromARGB(255, 5, 24, 40),
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    // fontFamily: "Lobster",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              alignment: Alignment.centerLeft,
              height: 60,
              child: TextField(
                controller: duration,
                keyboardType: TextInputType.name,
                style: TextStyle(color: Colors.black87),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 5, 24, 40))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 5, 24, 40))),
                  hintText: 'Duration of the contract ',
                  hintStyle: TextStyle(color: Color.fromARGB(255, 5, 24, 40)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              child: TextField(
                  controller: dateController,
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.calendar_today,
                      color: Color.fromARGB(255, 5, 24, 40),
                    ),
                    labelText: "Contract creation date ",
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 5, 24, 40),
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        // fontFamily: "Lobster",
                        fontWeight: FontWeight.bold),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                          2000,
                        ),
                        lastDate: DateTime(2101),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Color.fromARGB(255, 5, 24, 40),
                                onPrimary: Colors.white,
                                onSurface: Color.fromARGB(255, 5, 24, 40),
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  primary: Color.fromARGB(255, 5, 24, 40),
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        });
                    if (pickedDate != null) {
                      print(pickedDate);
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate);

                      setState(() {
                        dateController.text = formattedDate;
                      });
                    } else {
                      print("Date is not selected");
                    }
                  }),
            ),
            SizedBox(height: 30),
            Container(
              child: Row(
                children: [
                  Text(
                    "   Choose Type of contract           ",
                    style: TextStyle(
                        color: Color.fromARGB(255, 5, 24, 40),
                        fontSize: 20,
                        // fontFamily: "Lobster",
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  DropdownButton(
                      alignment: Alignment.bottomLeft,
                      icon: Icon(
                        Icons.add_home_work,
                        color: Color.fromARGB(255, 5, 24, 40),
                      ),
                      dropdownColor: Color.fromARGB(230, 244, 242, 243),
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 24, 40),
                      ),
                      items: [
                        "Sale",
                        "Rent",
                        "Buy",
                      ]
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text("$e"),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedType = val.toString();
                        });
                      },
                      value: selectedType),

//
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                    width: 180,
                    height: 40,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                        ),
                        child: const Text(
                          'continue',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: "",
                            // color: Color.fromARGB(255, 5, 24, 40),
                          ),
                        ),
                        onPressed: () {
                          CollectionReference create =
                              FirebaseFirestore.instance.collection("contract");

                          create.add({
                            "client name": clientname.text,
                            "duration-date": contractdate.text,
                            "contract date": dateController.text,
                            "type of contract": selectedType,
                            "other partie": otherpartie.text,
                            "price": price.text,
                            "type of item": typeofitem.text
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => contract(),
                            ),
                          );
                        })),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
