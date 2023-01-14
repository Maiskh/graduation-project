import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:database/phone.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class SginUp extends StatefulWidget {
  SginUp({Key? key}) : super(key: key);

  @override
  State<SginUp> createState() => _SginUpState();
}
class _SginUpState extends State<SginUp> {
  String selectedgender = '   ';
  String selecteditem = '   ';
  String selecteditems = '   ';
  String selecteditemsn = '   ';

  TextEditingController birthController = TextEditingController();
  final TextEditingController firstname = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  @override
  void dispose() {
    firstname.dispose();
    lastname.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      // backgroundColor: Colors.white,

      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage("images/55.jpg"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
            child: Column(children: [
          Padding(padding: EdgeInsets.all(135)),

          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: Text(
              "First Name  ",
              style: TextStyle(
                  color: Color.fromARGB(255, 26, 28, 54),
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontFamily: "",
                  fontWeight: FontWeight.bold),
            ),
          ),
          //  SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.centerLeft,
            height: 50,
            child: TextField(
              controller: firstname,
              keyboardType: TextInputType.name,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 26, 28, 54),
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 26, 28, 54),
                    )),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 47, 53, 143),
                ),
                hintText: 'First Name',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 26, 28, 54),
                ),

                //fillColor: Color.fromARGB(255, 135, 120, 114),
                //  filled: true,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Last Name",
              style: TextStyle(
                  color: Color.fromARGB(255, 26, 28, 54),
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontFamily: "",
                  fontWeight: FontWeight.bold),
            ),
          ),
          //  SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.centerLeft,
            height: 50,
            child: TextField(
            controller: lastname,
              keyboardType: TextInputType.name,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 26, 28, 54),
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 26, 28, 54),
                    )),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 47, 53, 143),
                ),
                hintText: 'Last Name',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 26, 28, 54),
                ),

                //fillColor: Color.fromARGB(255, 135, 120, 114),
                //  filled: true,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.bottomLeft,
            child: TextField(
                controller: birthController,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.calendar_today,
                    color: Color.fromARGB(255, 5, 24, 40),
                  ),
                  labelText: "your Birthday",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 5, 24, 40),
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontFamily: "",
                      fontWeight: FontWeight.bold),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1960),
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
                      birthController.text = formattedDate;
                    });
                  } else {
                    print("Date is not selected");
                  }
                }),
          ),
          SizedBox(
            height: 5,
          ),

          Container(
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Text(
                  "Your Gender",
                  style: TextStyle(
                      color: Color.fromARGB(255, 5, 24, 40),
                      fontSize: 20,
                      fontFamily: "",
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 146,
                ),
                DropdownButton(
                    alignment: Alignment.bottomRight,
                    icon: Icon(
                      Icons.man_outlined,
                      color: Color.fromARGB(255, 25, 91, 145),
                    ),
                    dropdownColor: Color.fromARGB(230, 244, 242, 243),
                    style: TextStyle(
                      color: Color.fromARGB(255, 5, 24, 40),
                    ),
                    items: [
                      '   ',
                      "Male",
                      "Female",
                    ]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text("$e"),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedgender = val.toString();
                      });
                    },
                    value: selectedgender),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Text(
                  " Your Country",
                  style: TextStyle(
                      color: Color.fromARGB(255, 5, 24, 40),
                      fontSize: 20,
                      fontFamily: "",
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 135,
                ),
                DropdownButton(
                    alignment: Alignment.bottomRight,
                    icon: Icon(
                      Icons.flag,
                      color: Color.fromARGB(255, 25, 91, 145),
                    ),
                    dropdownColor: Color.fromARGB(230, 244, 242, 243),
                    style: TextStyle(
                      color: Color.fromARGB(255, 5, 24, 40),
                    ),
                    items: [
                      '   ',
                      "Jordan",
                      "palestin",
                      "syria",
                      "lebanes",
                      "turky"
                    ]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text("$e"),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selecteditemsn = val.toString();
                      });
                    },
                    value: selecteditemsn),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Text(
                  "Your Nationality",
                  style: TextStyle(
                      color: Color.fromARGB(255, 5, 24, 40),
                      fontSize: 20,
                      fontFamily: "",
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 98,
                ),
                DropdownButton(
                    alignment: Alignment.centerRight,
                    icon: Icon(
                      Icons.flag,
                      color: Color.fromARGB(255, 25, 91, 145),
                    ),
                    dropdownColor: Color.fromARGB(230, 244, 242, 243),
                    style: TextStyle(
                      color: Color.fromARGB(255, 5, 24, 40),
                    ),
                    items: [
                      '   ',
                      "Jordanian",
                      "palestinian",
                      "syrian",
                      "lebanese",
                      "turkish"
                    ]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text("$e"),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selecteditem = val.toString();
                      });
                    },
                    value: selecteditem),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Text(
                  "Type of user",
                  style: TextStyle(
                      color: Color.fromARGB(255, 5, 24, 40),
                      fontSize: 20,
                      fontFamily: "",
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 122,
                ),
                DropdownButton(
                    alignment: Alignment.centerRight,
                    icon: Icon(
                      Icons.account_circle_sharp,
                      color: Color.fromARGB(255, 25, 91, 145),
                    ),
                    dropdownColor: Color.fromARGB(230, 244, 242, 243),
                    style: TextStyle(
                      color: Color.fromARGB(255, 5, 24, 40),
                    ),
                    items: [
                      '   ',
                      "Citizen",
                      "Government",
                      "Shops",
                      "Company",
                      "Institution"
                    ]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text("$e"),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selecteditems = val.toString();
                      });
                    },
                    value: selecteditems),
              ],
            ),
          ),
          // SizedBox(
          //   width: 100,
          // ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Container(
                  width: 180,
                  height: 40,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
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
                        CollectionReference db =
                            FirebaseFirestore.instance.collection("users");
                        db.add({
                          "first-name": firstname.text,
                          "last-name": lastname.text,
                          "birth-day": birthController.text,
                          "gender":selectedgender,
                          "country":selecteditemsn,
                          "nationality":selecteditem,
                          "type":selecteditems
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => phone_number(),
                          ),
                        );
                      }
                          )),
            ],
          ),
        ])),
      ),
    ));
  }
}
