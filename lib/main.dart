import 'dart:async';
import 'package:database/contract.dart';
import 'package:database/create.dart';
import 'package:database/manage_profile.dart';
import 'package:database/profile.dart';
import 'package:database/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //   color: Colors.white,
      child: Center(
        child: new Image.asset(
          'images/77.jpg',
          fit: BoxFit.cover,
          height: 850,
        ),
      ),
    );
  }
}
