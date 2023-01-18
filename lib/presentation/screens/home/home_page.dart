import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_application/exercieses.dart';
import 'package:workout_application/presentation/meals_display.dart';
import 'package:workout_application/presentation/screens/profile.dart';
import 'package:workout_application/data/const/colors.dart' as color;
import 'package:workout_application/video_info.dart';
import '../../../routing/routing.dart';
import '../exercises/exercieses.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List info = [];
  _initData() {}

  @override
  void initState() {
    super.initState();
    _initData();
  }

  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Text("HOME",
                      style: TextStyle(
                          fontSize: 30,
                          color: color.AppColor.homePageTitle,
                          fontWeight: FontWeight.w700)),
                  Expanded(child: Container()),
                  Icon(Icons.arrow_back_ios,
                      size: 20, color: color.AppColor.homePageIcons),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "let's do it",
                    style: TextStyle(
                        fontSize: 20,
                        color: color.AppColor.homePageSubtitle,
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "My Profile",
                    style: TextStyle(
                        fontSize: 20,
                        color: color.AppColor.homePageDetail,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profilepage()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: color.AppColor.homePageIcons,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            color.AppColor.gradientFirst.withOpacity(0.8),
                            color.AppColor.gradientSecond.withOpacity(0.9),
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(80),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(80)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 10),
                          blurRadius: 20,
                          color: color.AppColor.gradientSecond.withOpacity(0.2),
                        )
                      ]),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 100, top: 50, right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Training",
                          style: TextStyle(
                              fontSize: 20,
                              color: color.AppColor.homePageContainerTextSmall),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => oExercieses()),
                            );
                          },
                          child: Icon(
                            Icons.fitness_center_rounded,
                            size: 75,
                            color: color.AppColor.homePageIcons,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: color.AppColor.gradientFirst,
                                    blurRadius: 10,
                                    offset: Offset(4, 8))
                              ]),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            color.AppColor.gradientFirst.withOpacity(0.8),
                            color.AppColor.gradientSecond.withOpacity(0.9),
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(80),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(80)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 10),
                          blurRadius: 20,
                          color: color.AppColor.gradientSecond.withOpacity(0.2),
                        )
                      ]),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 100, top: 50, right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Meals",
                          style: TextStyle(
                              fontSize: 25,
                              color: color.AppColor.homePageContainerTextSmall),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => newMeals()),
                            );
                          },
                          child: Icon(
                            Icons.restaurant,
                            size: 75,
                            color: color.AppColor.homePageIcons,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: color.AppColor.gradientFirst,
                                    blurRadius: 10,
                                    offset: Offset(4, 8))
                              ]),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank_outlined),
            label: 'Meals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_gymnastics),
            label: 'Training',
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 55, 0, 255),
      ),
    );
  }
}
