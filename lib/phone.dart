import 'package:database/verfication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:phone_auth_otp_ui/phone_auth_otp_ui.dart';

class phone_number extends StatefulWidget {
  @override
  _phone_numberState createState() => _phone_numberState();
}

class _phone_numberState extends State<phone_number> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(top: 150),
              child: Center(
                child: Text('Add Phone Number',
                    style: TextStyle(
                        color: Color.fromARGB(255, 26, 28, 54),
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontFamily: "",
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            IntlPhoneField(
              controller: phoneController,
              decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(borderSide: BorderSide())),
              initialCountryCode: 'JO',
              onChanged: (phoneNumber) {
                setState(() {
                  // phone = phoneNumber.completeNumber;
                });
              },
            ),
          ]),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
              // color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        verfication_code(phoneController.text.trim())));
                //   verfication_code(phoneController.text)));
              },
              child: Text(
                'continue',
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  // fontFamily: "Lobster",
                  //  color: Color.fromARGB(255, 5, 24, 40),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> verifyPin(String pin) async {
    var verId;
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: pin);

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      final snackBar = SnackBar(content: Text("Login Success"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } on FirebaseAuthException catch (e) {
      final snackBar = SnackBar(content: Text("${e.message}"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
