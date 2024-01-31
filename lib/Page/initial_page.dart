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
  late Animation<double> _animation;
  double bottomPosition = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation = Tween<double>(begin: 0, end: -500).animate(_controller);

    Future.delayed(Duration(microseconds: 500), () {
      setState(() {
        bottomPosition = 2000.0;
      });
    });

    Timer.periodic(Duration(microseconds: 500), (timer) {
      setState(() {
        bottomPosition += 20.0;
        if (bottomPosition > 800) {
          bottomPosition = 2000.0;
        }
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
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
            bottom: bottomPosition,
            child: AnimatedOpacity(
              opacity: .6,
              duration: Duration(seconds: 2),
              child: Padding(
                padding: EdgeInsets.only(left: 160),
                child: Image.asset(
                  'Assets/images/porsche_top_view-removebg-preview.png',
                  height: 200,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 330, left: 85),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => HomeScreen())));
              },
              child: Image.asset(
                "Assets/images/logo_porsche-removebg-preview.png",
                height: 200,
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
