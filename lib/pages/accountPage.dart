import 'package:flutter/material.dart';


class accoutHolder extends StatefulWidget {
  const accoutHolder({super.key});

  @override
  State<accoutHolder> createState() => _accoutHolderState();
}

class _accoutHolderState extends State<accoutHolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
            children: [
              const Text('',
              ),
              Text(" ")
            ],
          )
      ),
      body: Column(
        children: [
          // SizedBox(height: 40,),
          const Text('My Expenses',style: TextStyle(
            fontSize: 28,
          ),
          ),
          Text('Summary(privavte)')
       ],
      ),
    );
  }
}