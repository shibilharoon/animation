import 'package:animation/Page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Turbos extends StatelessWidget {
  const Turbos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => HomeScreen())));
            },
            icon: Icon(
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
                      'Turbo S',
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
              child: Image.asset("Assets/images/turbo s.webp"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ''' The Porsche 911 Turbo S has a top speed of 330 kilometers per hour and can accelerate from 0 to 100 kilometers per hour in 2.7 seconds. It has a 3,745 cc, 6-cylinder, twin-turbo flat-6 engine that produces 641 brake horsepower at 6,750 revolutions per minute and 800 newton-meters of torque at 2,500 revolutions per minute. ''',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
