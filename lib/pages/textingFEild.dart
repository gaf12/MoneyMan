import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_money/utilities/notifications.dart';
import 'package:new_money/utilities/pie_chart.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utilities/lineChart.dart';

class TextFeild extends StatefulWidget {
  const TextFeild({Key? key});

  @override
  State<TextFeild> createState() => _TextFeildState();
}

class _TextFeildState extends State<TextFeild> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
            child: PageView(
              children: [
                Notifications(),
                LineChartWidget(),
              ],
            ),
    );
  }
}
