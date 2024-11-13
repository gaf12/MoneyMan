import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_money/utilities/createPieChat.dart';
import 'dart:math';

class pieChart extends StatefulWidget {
  const pieChart({super.key});

  @override
  State<pieChart> createState() => _pieChartState();
}

class _pieChartState extends State<pieChart> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: LayoutBuilder(builder: (context,constraint) => Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(193, 214, 233, 1),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              spreadRadius: -10,
              blurRadius: 19,
             offset: Offset(-5,-5),
              color: Colors.white,
            ),
            BoxShadow(
              spreadRadius: -2,
              blurRadius: 10,
              offset: Offset (7,7),
              color: Color.fromRGBO(146, 182, 216, 1)
            )
          ]
        ) ,
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: constraint.maxWidth * 0.6,
                  child: CustomPaint(
                    child: Center(),
                      foregroundPainter: CreatePie(
                       width: constraint.maxWidth * 0.5,
                        categorie: kCategory,
                      )
                  ),
                ),
              ),
              Center(
               child: Container(
                 height: constraint.maxWidth * 0.4,
                 decoration: BoxDecoration(
                     color: Color.fromRGBO(193, 214, 233, 1),
                     shape: BoxShape.circle,
                     boxShadow: [
                       BoxShadow(
                         blurRadius: 1,
                         offset: Offset(-1,-1),
                         color: Colors.white,
                       ),
                       BoxShadow(
                           spreadRadius: -2,
                           blurRadius: 10,
                           offset: Offset (5,5),
                           color: Colors.black.withOpacity(0.5)
                       )
                     ]
                ) ,
                child: Center(
                  child: Text('\$1200.20'),
                ),
               ),
              )
            ],
          ),
        ),
        )
    );
  }
}