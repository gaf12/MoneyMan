import 'package:flutter/material.dart';

import '../pages/signup.dart';
// import 'package:new_money/signup.dart';
// import 'backgroundVid.dart';
 // Import the VideoBackground widget

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    _navigate();
  }

  _navigate() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(

        children: [
          // Add the VideoBackground widget
          Center(
            child: Container(
              child: Text('Loading...'),
            ),
          ),
        ],
      ),
    );
  }
}
