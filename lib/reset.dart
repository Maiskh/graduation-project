import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  late String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage("images/99.jpg"), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(horizontal: 43.5, vertical: 50),
        child: Column(
          children: [
            // Padding(
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 51, 56, 124),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
            SizedBox(
              height: 28,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(88, 36),
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: _email)
                        .then((value) => Navigator.of(context).pop());
                  },
                  child: Text(
                    "Send Request",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],

              // auth.sendPasswordResetEmail(email: _email);
              // Navigator.of(context).pop();
            ),

            // TextButton(
            //     child: Text('Send Request',
            //         style: TextStyle(
            //             color: Color.fromARGB(255, 26, 28, 54),
            //             fontSize: 20,
            //             fontStyle: FontStyle.normal,
            //             //    fontFamily: "",
            //             fontWeight: FontWeight.bold)),
            //     onPressed: () {
            //       FirebaseAuth.instance
            //           .sendPasswordResetEmail(email: _email)
            //           .then((value) => Navigator.of(context).pop());
            //       // auth.sendPasswordResetEmail(email: _email);
            //       // Navigator.of(context).pop();
            //     }
            //     // Future<AuthStatus> resetPassword({required String email}) async {
            //     //   await _auth
            //     //       .sendPasswordResetEmail(email: email)
            //     //       .then((value) => _status = AuthStatus.successful)
            //     //       .catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
            //     //   return _status;
            //     // }

            //     // color: Theme.of(context).accentColor,
            //     ),
          ],
        ),
      ),
    );
  }
}
