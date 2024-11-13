// import 'dart:html';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:new_money/bankDetails.dart';
import 'package:new_money/cardsCreation/cardAddition.dart';
// import 'package:new_money/signup.dart';


class SplashBank extends StatefulWidget {
  const SplashBank({super.key});

  @override
  State<SplashBank> createState() => _SplashBankState();
}

class _SplashBankState extends State<SplashBank> {
  void initState() {
    super.initState();
    _navigate();
  }
  _navigate() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Cards(accountNumber: '',)));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Text("Fetching bank details"),
            SizedBox(height: 10,),
            if (Platform.isIOS)
              Stack(
                alignment: Alignment.center,
                children: [
                  CupertinoActivityIndicator(radius: 75),
                  Positioned(
                    child: Image.asset('assets/bank.jpg'),
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
          ],
          // minAxisAlignment:
        ),
      ),
    );();
  }
}
