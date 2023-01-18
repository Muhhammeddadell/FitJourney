import 'dart:convert';

import "package:flutter/material.dart";
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:video_player/video_player.dart';
import 'package:workout_application/data/const/colors.dart' as color;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:workout_application/presentation/screens/home/home_page.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playarea = false;
  bool _isPlaying = false;
  bool _diposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _diposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //Background Gradient
      decoration: _playarea == false
          ? BoxDecoration(
              gradient: LinearGradient(
              colors: [
                color.AppColor.gradientFirst.withOpacity(0.9),
                color.AppColor.gradientSecond
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            ))
          : BoxDecoration(
              color: color.AppColor.gradientSecond,
            ),
      // Top Bar
      child: Column(
        children: [
          _playarea == false
              ? Container(
                  padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Push Workout",
                          style: TextStyle(
                              fontSize: 25,
                              color: color.AppColor.secondPageTitleColor),
                        ),
                        Text(
                          "Chest and Triceps",
                          style: TextStyle(
                              fontSize: 25,
                              color: color.AppColor.secondPageTitleColor),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: 90,
                                height: 30,
                                // Timer Icon Background Gradient
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                        colors: [
                                          color.AppColor
                                              .secondPageContainerGradient1stColor,
                                          color.AppColor
                                              .secondPageContainerGradient2ndColor
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight)),
                                // Timer Icon Row
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        size: 20,
                                        color:
                                            color.AppColor.secondPageIconColor,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "60 min ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: color
                                                .AppColor.secondPageIconColor),
                                      )
                                    ]),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 200,
                              height: 30,
                              // Handyman Icon Background Gradient
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      colors: [
                                        color.AppColor
                                            .secondPageContainerGradient1stColor,
                                        color.AppColor
                                            .secondPageContainerGradient2ndColor
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight)),
                              // Handyman Icon Row
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.handyman_outlined,
                                      size: 20,
                                      color: color.AppColor.secondPageIconColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Dumbells , Barbells ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: color
                                              .AppColor.secondPageIconColor),
                                    )
                                  ]),
                            )
                          ],
                        ),
                      ]),
                )
              : Container(
                  child: Column(
                  children: [
                    Container(
                      height: 100,
                      padding:
                          const EdgeInsets.only(top: 50, left: 30, right: 30),
                      child: Row(children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: color.AppColor.secondPageIconColor,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.info_outline,
                          size: 20,
                          color: color.AppColor.secondPageIconColor,
                        )
                      ]),
                    ),
                    _playView(context),
                    _controlView(context),
                  ],
                )),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
              ),
              child: Column(children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Text(
                      "Circuit 1 : Legs Toning ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color.AppColor.circuitsColor,
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Icon(
                          Icons.loop,
                          size: 30,
                          color: color.AppColor.loopColor,
                        ),
                        Text(
                          "3 Sets ",
                          style: TextStyle(
                            fontSize: 15,
                            color: color.AppColor.setsColor,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: _listView(),
                )
              ]),
            ),
          ),
        ],
      ),
    ));
  }

  _listView() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        itemCount: videoInfo.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if (_playarea == false) {
                  _playarea = true;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }

  _buildCard(int index) {
    return Container(
      height: 135,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(videoInfo[index]["thumbnail"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        videoInfo[index]["time"],
                        style: TextStyle(color: Colors.grey[500]),
                      ))
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                    color: Color(0xFFeaeefc),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "15s rest  ",
                    style: TextStyle(color: Color(0xFF839fed)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9, //The best aspect ratio for most mobile phones
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: Text(
            "Preparing....",
            style: TextStyle(fontSize: 20, color: Colors.white60),
          )));
    }
  }

  var _onUpdateControllerTime;
  void _onControllerUpdate() async {
    if (_diposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;
    final controller = _controller;
    if (controller == null) {
      debugPrint("Controller is null ");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("Controller cannot be inizialized  ");
    }
    final playing = controller.value.isPlaying;
    _isPlaying = playing;
  }

  _onTapVideo(int index) async {
    final controller =
        VideoPlayerController.network(videoInfo[index]["videoUrl"]);

    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        _controller?.play();
        setState(() {});
      });
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value.volume ?? 0) > 0;
    return Column(
      children: [
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 5),
          color: color.AppColor.gradientSecond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(50, 0, 0, 0))
                    ]),
                    child: Icon(
                      noMute ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  if (noMute) {
                    _controller?.setVolume(0);
                  } else {
                    _controller?.setVolume(1.0);
                  }
                  setState(() {});
                },
              ),
              TextButton(
                  onPressed: () async {
                    final index = _isPlayingIndex - 1;
                    if (index >= 0 && videoInfo.length >= 0) {
                      _onTapVideo(index);
                    } else {}
                  },
                  child: Icon(
                    Icons.fast_rewind,
                    size: 36,
                    color: Colors.white,
                  )),
              TextButton(
                  onPressed: () async {
                    if (_isPlaying) {
                      setState(() {
                        _isPlaying = false;
                      });
                      _controller?.pause();
                    } else {
                      setState(() {
                        _isPlaying = true;
                      });
                      _controller?.play();
                    }
                  },
                  child: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 36,
                    color: Colors.white,
                  )),
              TextButton(
                  onPressed: () async {
                    final index = _isPlayingIndex + 1;
                    if (index <= videoInfo.length - 1) {
                      _onTapVideo(index);
                    } else {}
                  },
                  child: Icon(
                    Icons.fast_forward,
                    size: 36,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
