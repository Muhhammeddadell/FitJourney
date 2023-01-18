// ignore_for_file: deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:workout_application/domain/models/users.dart';
import 'package:workout_application/presentation/controllers/auth_controller.dart';
import 'package:workout_application/presentation/controllers/auth_service.dart';
import 'package:workout_application/presentation/screens/auth_screen/login.dart';
import 'package:workout_application/presentation/screens/exercises/exercieses.dart';
import 'package:workout_application/presentation/screens/home/home_page.dart';
import 'package:workout_application/presentation/test.dart';
import 'package:workout_application/video_info.dart';
import 'package:get/get.dart';
import 'package:workout_application/data/const/colors.dart' as color;
import 'package:firebase_database/firebase_database.dart';

import '../meals_display.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(Profilepage());
}

class Profilepage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _Profilepage createState() => _Profilepage();
}

class _Profilepage extends State<Profilepage> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 1, 11, 58),
            title: Center(
              child: const Text('Profile'),
            ),
          ),
          body: ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.AppColor.gradientFirst.withOpacity(0.8),
                      color.AppColor.gradientSecond.withOpacity(0.9),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.5, 0.9],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          minRadius: 35.0,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => HomePage());
                            },
                            child: Icon(
                              Icons.home,
                              size: 45,
                              color: color.AppColor.homePageIcons,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          minRadius: 60.0,
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage("assets/"),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          minRadius: 35.0,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => HomePage());
                            },
                            child: Icon(
                              Icons.calendar_month,
                              size: 45,
                              color: color.AppColor.homePageIcons,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("USER")
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => nExercieses()),
                        );
                      },
                      child: const SizedBox(
                          height: 35,
                          width: double.infinity,
                          child: Text(
                            "Exercieses",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          )),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: Color.fromARGB(255, 255, 255, 255),
                        onPrimary: Color.fromARGB(255, 0, 22, 119),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 25),
                      ),
                    ),
                    Divider(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => newMeals()),
                        );
                      },
                      child: const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Meals",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          )),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: Color.fromARGB(255, 255, 255, 255),
                        onPrimary: Color.fromARGB(255, 0, 22, 119),
                        padding: const EdgeInsets.symmetric(
                            vertical: 35, horizontal: 25),
                      ),
                    ),
                    Divider(),
                    ElevatedButton(
                      onPressed: () {
                        AuthService().signOut();
                      },
                      child: const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Log Out",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          )),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: Color.fromARGB(255, 255, 255, 255),
                        onPrimary: Color.fromARGB(255, 0, 22, 119),
                        padding: const EdgeInsets.symmetric(
                            vertical: 35, horizontal: 25),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
