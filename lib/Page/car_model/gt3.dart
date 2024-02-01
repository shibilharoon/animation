// ignore_for_file: library_private_types_in_public_api

import 'package:animation/Page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Gt3RS extends StatefulWidget {
  const Gt3RS({Key? key}) : super(key: key);

  @override
  _Gt3RSState createState() => _Gt3RSState();
}

class _Gt3RSState extends State<Gt3RS> with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;
  bool isThirdImageRotated = false;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _rotationAnimation = CurvedAnimation(
      parent: _rotationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  void _toggleRotation() {
    isThirdImageRotated
        ? _rotationController.reverse()
        : _rotationController.forward();
    setState(() {
      isThirdImageRotated = !isThirdImageRotated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => const HomeScreen())),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 60,
              width: 400,
              color: Colors.black,
              child: TweenAnimationBuilder(
                builder: (BuildContext context, double val, child) {
                  return Opacity(
                    opacity: val,
                    child: Padding(
                      padding: EdgeInsets.only(top: val),
                      child: child,
                    ),
                  );
                },
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 5),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'GT 3 RS',
                        style: GoogleFonts.yellowtail(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.asset(
                "Assets/images/gt3.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '''The Porsche 911 GT3 RS is a street-legal sports car that Porsche says is the best-handling 911 road car ever on a racetrack. The GT3 RS has a 4.0-liter, high-revving, naturally aspirated 525PS engine that can go from 0–100 km/h in 3.2 seconds. It has a top speed of 296 km/h and a 3996 cc, 6 cylinder flat engine.''',
                style: TextStyle(color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: _toggleRotation,
              child: RotationTransition(
                turns: _rotationAnimation,
                child: Image.asset(
                  "Assets/images/gt3_png-removebg-preview.png",
                  height: 180,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
