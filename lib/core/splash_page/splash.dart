import 'package:alnour/core/auth/login.dart';
import 'package:flutter/material.dart';

import '../../constants/constants/backgroundimage.dart';
import '../../constants/constants/images.dart';

class Splashpage extends StatefulWidget {
  @override
  _SplashpageState createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.1, // Specify the initial scale value here
      end:
          1.0, // Specify the final scale value here (in this case, back to the original size)
    ).animate(_controller);

    _controller.forward().whenComplete(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LogInScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundImage(),
          Row(
            children: [
              Image.asset(
                ImageAssets.school,
                height: 150,
                width: 150,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Image.asset(
                      ImageAssets.nour,
                      width: 200,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    ImageAssets.book,
                    // height: 200,
                    width: 200,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }
}
