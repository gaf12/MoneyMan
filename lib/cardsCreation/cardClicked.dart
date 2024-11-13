import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class setLimit extends StatelessWidget {
  final String accountNumber;
  setLimit({required this.accountNumber});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Limit On Card'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Form(
        child: Text('Text: $accountNumber'),

      ),
    );
  }
}
