import 'package:animation/Page/car_model/cayenne.dart';
import 'package:animation/Page/car_model/gt3.dart';
import 'package:animation/Page/car_model/macan.dart';
import 'package:animation/Page/car_model/turbos.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.5),
                ])),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 140, top: 60),
          //   child: Text(
          //     "PORSCHE",
          //     style: GoogleFonts.caveat(color: Colors.white, fontSize: 30),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 205,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((context) => Gt3RS())));
                      },
                      child: Image.asset(
                        "Assets/images/gt3.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 210,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => Cayenne())));
                      },
                      child: Image.asset(
                        "Assets/images/cayenne.webp",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => Turbos())));
                      },
                      child: Image.asset(
                        "Assets/images/turbo s.webp",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 210,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((context) => Macan())));
                      },
                      child: Image.asset(
                        "Assets/images/maccan.webp",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
