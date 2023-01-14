import 'dart:typed_data';
import 'package:database/account.dart';
import 'package:database/login.dart';
import 'package:database/signup.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'main.dart';


class signature_ extends StatefulWidget {
  const signature_({Key? key}) : super(key: key);

  @override
  State<signature_> createState() => _signature_State();
}

class _signature_State extends State<signature_> {
  Uint8List? exportedImage;

  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Color.fromARGB(255, 5, 24, 40),
    exportBackgroundColor: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Signature Pad",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'Lobster',
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 5, 24, 40),
        leading: IconButton(
          padding: EdgeInsets.only(),
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 5, 24, 40),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      // backgroundColor: Color.fromARGB(255, 210, 231, 249),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage("images/16.jpg"), fit: BoxFit.cover),
        ),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(30)),
            Text(
              "           Add your signature ",
              style: TextStyle(
                  color: Color.fromARGB(255, 5, 24, 40),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lobster',
                  fontSize: 30),
            ),
            SizedBox(height: 20),
            Signature(
              controller: controller,
              height: 250,
              width: 250,
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () async {
                        exportedImage = await controller.toPngBytes();

                        setState(() {});
                      },
                      child: const Text(
                        "Save Signature ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 24, 40),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lobster',
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        controller.clear();
                      },
                      child: const Text(
                        "Edit  Signature",
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 24, 40),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lobster',
                        ),
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            if (exportedImage != null)
              Image.memory(
                exportedImage!,
                width: 300,
                height: 250,
              ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SginUp(),
                          ),
                        );
                      },
                      child: const Text(
                        "previous page",
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 24, 40),
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lobster',
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: new Text("Creat Account"),
                            content: new Text(" Are You sure !"),
                            actions: <Widget>[
                              new ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 5, 24, 40),
                                ),
                                child: new Text(
                                  "OK",
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
                            ],
                          );
                        },

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ProfileScreen(),
                        //   ),
                      );
                    },
                    child: const Text(
                      " Finish",
                      style: TextStyle(
                        color: Color.fromARGB(255, 69, 34, 21),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lobster',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


