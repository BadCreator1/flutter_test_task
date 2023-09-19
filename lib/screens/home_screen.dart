
import 'dart:math';

import 'package:flutter/material.dart';

import '../components/autoplay_button.dart';
import '../models/gradient_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<GradientColor> colors = [
    GradientColor(startColor: const Color(0xff2E3192), endColor: const Color(0xff1BFFFF)),
    GradientColor(startColor: const Color(0xffD4145A), endColor: const Color(0xffFBB03B)),
    //GradientColor(startColor: Color(0xff009245), endColor: Color(0xffFCEE21)),
    GradientColor(startColor: const Color(0xff662D8C), endColor: const Color(0xffED1E79)),
    GradientColor(startColor: const Color(0xffD8B5FF), endColor: const Color(0xff1EAE98)),
    GradientColor(startColor: const Color(0xffEA8D8D), endColor: const Color(0xffA890FE)),
  ];
  
  int index = 0;
  bool autoplay = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Test Task')),
        body: GestureDetector(
          onTap: () {
            if (!autoplay) {
              setState(getRandomIndex);
            }
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            onEnd: () {
              if (autoplay) {
                Future.delayed(const Duration(seconds: 1), () {
                  setState(getRandomIndex);
                });
              }
            },
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colors[index].startColor,
                colors[index].endColor,
              ],
            )),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hello There!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: AutoplayButton(
                    autoplay: autoplay,
                    onTap: () {
                      setState(() {
                        autoplay = !autoplay;
                        getRandomIndex();
                      });
                    },
                  ),
                )
              ],
            )),
          ),
        ));

  void getRandomIndex() {
    final lastIndex = index;
    do {
      index = Random().nextInt(colors.length);
    } while (index == lastIndex);
  }

  void toggleAutoplay() {
    setState(() {
      autoplay = !autoplay;
      getRandomIndex();
    });
  }
}
