import 'package:bcrypt/bcrypt.dart';
import 'package:database/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';


class sigup2 extends StatefulWidget {
  @override
  _sigup2State createState() => _sigup2State();
}

class _sigup2State extends State<sigup2> {
  late String _email, _password ;
  bool hashed = false;
  

  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
    TextEditingController HashedController = new TextEditingController();

//  TextEditingController FName = TextEditingController();

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 210, 231, 249),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage("images/44.jpg"), fit: BoxFit.cover),
        ),
        child: ListView(children: [
          Padding(padding: EdgeInsets.all(100)),
          SizedBox(height: 5),

          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "User Name",
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
              onChanged: (value) {
                setState(() {
                  // _email = value.trim();
                });
              },
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
                hintText: 'UserName',
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
            child: Text(
              "Email",
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
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
              controller: nameController,
              keyboardType: TextInputType.emailAddress,
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
                  Icons.email,
                  color: Color.fromARGB(255, 47, 53, 143),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 26, 28, 54),
                ),

                //fillColor: Color.fromARGB(255, 135, 120, 114),
                //  filled: true,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            child: Text(
              ' Password',
              style: TextStyle(
                  color: Color.fromARGB(255, 26, 28, 54),
                  fontSize: 20,
                  //fontFamily: "Lobster",
                  fontWeight: FontWeight.bold),
            ),
          ),
          // SizedBox(height: 2),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.centerLeft,
            height: 50,
            child: TextField(
              onChanged: (value) {
                setState(() {
                 _password =BCrypt.hashpw(passwordController.text,BCrypt.gensalt());
                
                  _password = value.trim();
                });
              },
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
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
                  Icons.lock,
                  color: Color.fromARGB(255, 47, 53, 143),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 26, 28, 54),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            child: Text(
              ' Confirm Password',
              style: TextStyle(
                  color: Color.fromARGB(255, 26, 28, 54),
                  fontSize: 20,
                  //fontFamily: "Lobster",
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.centerLeft,
            height: 50,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  hashed=BCrypt.checkpw(passwordController.text, HashedController.text);
                                 hashed=value.isEmpty
;
                
                });
              },
        obscureText: true,
              keyboardType: TextInputType.visiblePassword,
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
                  Icons.lock,
                  color: Color.fromARGB(255, 47, 53, 143),
                ),
                hintText: 'Confirm Password',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 26, 28, 54),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          Column(children: [
            Container(
              width: 190,
              height: 30,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  child: Text(
                    "Creat Account",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () async {
                    try {
                      FirebaseAuth AuthObject = FirebaseAuth.instance;
                      UserCredential mysignupcre =
                          await AuthObject.createUserWithEmailAndPassword(
                        email: nameController.text,
                        password: passwordController.text,
                      );
                      passwordController.clear();
                      nameController.clear();
                    } catch (e) {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("sorry try again"),
                          );
                        },
                      );
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SginUp()),
                    );
                  }),
            ),
          ]),
        ]),
      ),
    );
  }
}