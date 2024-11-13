

import 'dart:math';

import 'package:flutter/cupertino.dart';

class CreatePie extends CustomPainter{
  CreatePie({required this.categorie, required this.width});

  final List<Category> categorie;
  final double width;
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    var paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = width/2;

    double total = -pi/2;
    categorie.forEach((expenses) => total += expenses.amount);
    double startRadin = 0;
    for (var index = 0; index < categorie.length;index++){
      final currentCat = categorie.elementAt(index);
      final sweepRad =currentCat.amount / total * 2 * pi;
      paint.color = Kcolos.elementAt(index % categorie.length);
      canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          startRadin,
          sweepRad,
          false,
          paint);
      startRadin += sweepRad;
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate)=> true;
}



class Category {
  Category(this.name,{required this.amount});
  final String name;
  final double amount;
}


final kCategory = [
  Category('food', amount: 500),
  Category('food', amount: 700),
  Category('food', amount: 590),
  Category('food', amount: 100),
  Category('food', amount: 800),
];

final Kcolos = [
  Color.fromRGBO(82, 98, 255, 1),
  Color.fromRGBO(46, 198, 255, 1),
  Color.fromRGBO(123, 201, 82, 1),
  Color.fromRGBO(255, 91, 67, 1),
  Color.fromRGBO(139, 139, 130, 1),

];