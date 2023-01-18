import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controllers/auth_controller.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

String? userName;

class Database {
  static void showDisplayName() async {
    var collection = FirebaseFirestore.instance.collection('Users');
    //userUid is the current auth user
    var docSnapshot = await collection.doc("am0Wv8LpGgJInHK6W0zD").get();

    Map<String, dynamic> data = docSnapshot.data()!;

    userName = data['user_name'];
  }
}

void main(List<String> args) {
  print(userName);
}
