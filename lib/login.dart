import 'package:database/account.dart';
import 'package:database/profile.dart';
import 'package:database/reset.dart';
import 'package:database/signup.dart';
import 'package:database/signup2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String _email, _password;

  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController FName = TextEditingController();

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 210, 231, 249),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage("images/100.jpg"), fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(100)),
            SizedBox(height: 5),
            // Container(
            //     alignment: Alignment.center,
            //     padding: const EdgeInsets.all(15),
            //     child: const Text(
            //       'LOG_IN',
            //       style: TextStyle(
            //           color: Color.fromARGB(255, 26, 28, 54),
            //           fontWeight: FontWeight.w500,
            //           fontFamily: 'Lobster',
            //           fontSize: 40),
            //     )),
            SizedBox(height: 5),

            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Email Address",
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
              height: 60,
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
            SizedBox(height: 10.0),
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
              height: 60,
              child: TextField(
                onChanged: (value) {
                  setState(() {
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
                  // fillColor: Colors.grey,
                  // filled: true,
                ),
              ),
            ),
            SizedBox(height: 30),
            // TextButton(
            //   child: const Text(
            //     'Log in',
            //     style: TextStyle(
            //       fontStyle: FontStyle.normal,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 25,
            //       //   fontFamily: "Lobster",
            //       color: Color.fromARGB(255, 26, 28, 54),
            //     ),

            Column(
              children: [
                Container(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    child: Text(
                      "log_in",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      try {
                        FirebaseAuth myauth = FirebaseAuth.instance;

                        UserCredential myloginprocess =
                            await myauth.signInWithEmailAndPassword(
                                email: nameController.text,
                                password: passwordController.text);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ProfileScreen();
                          },
                        ));
                      } catch (e) {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text("sorry try again "),
                            );
                          },
                        );
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Prof()),
                      );
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Row(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResetScreen()),
                    );
                  },
                  child: const Text(
                    'Forgot Password ?                                     ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 26, 28, 54),
                        fontSize: 17,
                        //   fontFamily: "Lobster",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  child: const Text(
                    'New User',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      //   fontFamily: "Lobster",
                      color: Color.fromARGB(255, 26, 28, 54),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => sigup2()),
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
