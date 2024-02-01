import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'car_model/cayenne.dart';
import 'car_model/gt3.dart';
import 'car_model/macan.dart';
import 'car_model/turbos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Center(
              child: Column(
                children: [
                  _buildDelayedShimmerContainer(
                      "Assets/images/gt3.jpg", "gt3-img", const Gt3RS()),
                  _buildDelayedShimmerContainer(
                      "Assets/images/cayenne.webp", "cayenne-img", const Cayenne()),
                  _buildDelayedShimmerContainer(
                      "Assets/images/turbo s.webp", "turbo-img", const Turbos()),
                  _buildDelayedShimmerContainer(
                      "Assets/images/maccan.webp", "maccan-img", const Macan()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDelayedShimmerContainer(
      String imagePath, String heroTag, Widget destinationPage) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _buildShimmerContainer(imagePath, heroTag, destinationPage);
        } else {
          return _buildShimmerContainerPlaceholder();
        }
      },
    );
  }

  Widget _buildShimmerContainer(
      String imagePath, String heroTag, Widget destinationPage) {
    return Container(
      width: double.infinity,
      height: 205,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => destinationPage),
          );
        },
        child: Hero(
          tag: heroTag,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerContainerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 0, 0, 0),
      highlightColor: const Color.fromARGB(255, 27, 27, 27),
      child: Container(
        width: double.infinity,
        height: 205,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
