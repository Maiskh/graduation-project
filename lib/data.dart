import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FireStoreDataBase {
  List usesrsList = [];

  final CollectionReference db = FirebaseFirestore.instance.collection("users");

  Future getData() async {
    try {
      //to get data from a single/particular document alone.
      // var temp = await db.doc("/users/7Fz6oSc840TifH3To1SD").get();

      // to get data from all documents sequentially
      await db.get().then((querySnapshot) {

        for (var result in querySnapshot.docs) {
          usesrsList.add(result.data());
        }
      });

      return usesrsList;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }
}
class FireStoreDataBase2 {
    List usesrsList2 = [];
  final CollectionReference db = FirebaseFirestore.instance.collection("users");

  Future getData2() async {
    try {
      //to get data from a single/particular document alone.
      // var temp = await db.doc("/users/7Fz6oSc840TifH3To1SD").get();

      // to get data from all documents sequentially
      await db.get().then((querySnapshot) {

        for (var result in querySnapshot.docs) {
          usesrsList2.add(result.data());
        }
      });
      return usesrsList2;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }
}
class FireStoreDataBase3 {
    List usesrsList3 = [];
  final CollectionReference create = FirebaseFirestore.instance.collection("contract");

  Future getData3() async {
    try {
      //to get data from a single/particular document alone.
      // var temp = await db.doc("/users/7Fz6oSc840TifH3To1SD").get();

      // to get data from all documents sequentially
      await create.get().then((querySnapshot) {

        for (var result in querySnapshot.docs) {
          usesrsList3.add(result.data());
        }
      });

      return usesrsList3;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }
}