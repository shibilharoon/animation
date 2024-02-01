// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AnimationProvider extends ChangeNotifier {
//   late AnimationController controller;
//   late Animation<double> animation;
//   double bottomPosition = 0.0;
//   double opacityValue = 1.0;

//   AnimationProvider(this.controller) {
//     animation = Tween<double>(begin: 0, end: -500).animate(controller);
//     Future.delayed(Duration(microseconds: 500), () {
//       bottomPosition = 2000.0;
//       notifyListeners();
//     });

//     Timer.periodic(Duration(microseconds: 2500), (timer) {
//       bottomPosition += 20.0;
//       if (bottomPosition > 800) {
//         bottomPosition = 2000.0;
//       }

//       opacityValue = (bottomPosition - 800) / 1200;
//       opacityValue = opacityValue.clamp(0.0, 0.0);
//       notifyListeners();
//     });
//   }
// }
