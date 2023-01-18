import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout_application/presentation/screens/home/home_page.dart';

class UserManagement {
  storeNewUser(user, context) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection("Users")
        .doc(firebaseUser!.uid)
        .set({'email': user.email, 'uid': user.uid})
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage())))
        .catchError((e) {
          print(e);
        });
  }
}
