import 'package:animation/Page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Macan extends StatelessWidget {
  const Macan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => const HomeScreen())));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
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
                  child: Center(
                    child: Text(
                      'Macan',
                      style: GoogleFonts.yellowtail(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.asset("Assets/images/maccan.webp"),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                ''' The Porsche Macan is a compact luxury crossover SUV that has been produced by Porsche since February 2014. It is the smallest SUV from Porsche, coming in below the Cayenne. ''',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
