import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_application/presentation/screens/profile.dart';
import 'package:workout_application/video_info.dart';
import 'package:workout_application/data/const/colors.dart' as color;

void main(List<String> args) {
  runApp(MaterialApp(home: oExercieses()));
}

class oExercieses extends StatefulWidget {
  const oExercieses({super.key});

  @override
  State<oExercieses> createState() => _oExercieses();
}

class _oExercieses extends State<oExercieses> {
  List info = [];
  bool loading = true;
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info = json.decode(value);

      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text("Exercieses",
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
                  "Your Program",
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
                InkWell(
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
              height: 10,
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: loading
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: (info.length.toDouble() / 2).toInt(),
                        itemBuilder: (_, int index) {
                          int a = 2 * index;
                          int b = 2 * index + 1;
                          return Row(
                            children: [
                              InkWell(
                                child: Container(
                                    margin: EdgeInsets.only(
                                      left: 30,
                                      bottom: 30,
                                    ),
                                    width: (MediaQuery.of(context).size.width -
                                            90) /
                                        2,
                                    height: 170,
                                    padding: EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(info[a]["img"])),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: Offset(5, 5),
                                            color: color.AppColor.gradientSecond
                                                .withOpacity(0.1)),
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: Offset(-5, -5),
                                            color: color.AppColor.gradientSecond
                                                .withOpacity(0.1))
                                      ],
                                    ),
                                    child: Center(
                                      child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            info[a]["title"],
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: color
                                                    .AppColor.homePageDetail),
                                          )),
                                    )),
                                onTap: () {
                                  Get.to(() => VideoInfo());
                                },
                              ),
                              InkWell(
                                child: Container(
                                    width: (MediaQuery.of(context).size.width -
                                            90) /
                                        2,
                                    height: 170,
                                    margin:
                                        EdgeInsets.only(left: 30, bottom: 30),
                                    padding: EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(info[b]["img"])),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: Offset(5, 5),
                                            color: color.AppColor.gradientSecond
                                                .withOpacity(0.1)),
                                        BoxShadow(
                                            blurRadius: 3,
                                            offset: Offset(-5, -5),
                                            color: color.AppColor.gradientSecond
                                                .withOpacity(0.1))
                                      ],
                                    ),
                                    child: Center(
                                      child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            info[b]["title"],
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: color
                                                    .AppColor.homePageDetail),
                                          )),
                                    )),
                                onTap: () {
                                  Get.to(() => VideoInfo());
                                },
                              ),
                            ],
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
