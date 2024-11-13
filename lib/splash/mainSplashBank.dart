
    import 'dart:io';
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
import 'package:new_money/pages/firstPage.dart';





class bankSpil extends StatefulWidget {
    const bankSpil({super.key});

    @override
    State<bankSpil> createState() => _bankSpilState();
  }

  class _bankSpilState extends State<bankSpil> {
    void initState() {
      super.initState();
      _navigate();
    }
    _navigate() async {
      await Future.delayed(Duration(milliseconds: 1500), () {});
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => FirstPage()));
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
            height: 45,
            width: 45,
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
