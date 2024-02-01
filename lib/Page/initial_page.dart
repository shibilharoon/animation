// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:animation/Page/home_screen.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double bottomPosition = 0.0;
  double opacityValue = 1.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );


    Future.delayed(const Duration(microseconds: 500), () {
      setState(() {
        bottomPosition = 2000.0;
      });
    });

    Timer.periodic(const Duration(microseconds: 2500), (timer) {
      setState(() {
        bottomPosition += 20.0;
        if (bottomPosition > 800) {
          bottomPosition = 2000.0;
        }

        opacityValue = (bottomPosition - 800) / 1200;
        opacityValue = opacityValue.clamp(0.0, 0.0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            bottom: bottomPosition,
            child: AnimatedOpacity(
              opacity: opacityValue,
              duration: const Duration(seconds: 2),
              child: Padding(
                padding: const EdgeInsets.only(left: 160),
                child: Image.asset(
                  'Assets/images/porsche_top_view-removebg-preview.png',
                  height: 200,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 400, left: 85),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => const HomeScreen())));
              },
              child: AnimatedOpacity(
                opacity: 1.0 - opacityValue,
                duration: const Duration(seconds: 2),
                child: Image.asset(
                  "Assets/images/logo_porsche-removebg-preview.png",
                  height: 200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
