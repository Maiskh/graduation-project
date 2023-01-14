import 'package:database/signature.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pinput/pinput.dart';

class verfication_code extends StatefulWidget {
  final String phone;
  verfication_code(this.phone);
  @override
  _verfication_codeState createState() => _verfication_codeState();
}

class _verfication_codeState extends State<verfication_code> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("images/33.jpg"), fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(50)),
                Container(
                  // margin: EdgeInsets.only(top: 40),
                  child: Center(
                    child: Text(
                      'Verify +962-${widget.phone}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Color.fromARGB(255, 46, 107, 154)),
                    ),
                  ),
                ),
                // IntlPhoneField(
                //   decoration: InputDecoration(
                //       labelText: 'Phone Number',
                //       border: OutlineInputBorder(borderSide: BorderSide())),
                //   initialCountryCode: 'IN',
                //   onChanged: (phoneNumber) {
                //     setState(() {
                //       // phone = phoneNumber.completeNumber;
                //     });
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    controller: _pinPutController,
                    pinAnimationType: PinAnimationType.fade,
                    onSubmitted: (pin) async {
                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(PhoneAuthProvider.credential(
                                verificationId: _verificationCode!,
                                smsCode: pin))
                            .then((value) async {
                          if (value.user != null) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signature_()),
                                (route) => false);
                          }
                        });
                        //  UserCredential userCredential = await ConfirmationResult.confirm('123456');

                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    },
                  ),
                )
              ],
            )));
  }

  _verifyPhone() async {
    await auth.verifyPhoneNumber(
        phoneNumber: '+962${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => signature_()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 10));
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

//   Future<void> verifyPin(String pin) async {
//     var verId;
//     PhoneAuthCredential credential =
//         PhoneAuthProvider.credential(verificationId: verId, smsCode: pin);

//     try {
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       final snackBar = SnackBar(content: Text("Login Success"));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     } on FirebaseAuthException catch (e) {
//       final snackBar = SnackBar(content: Text("${e.message}"));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//   }
}
