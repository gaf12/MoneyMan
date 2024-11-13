import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:new_money/pages/textingFEild.dart';
import 'package:new_money/utilities/dWidget.dart';
import 'package:new_money/utilities/drawer.dart';
import 'package:new_money/utilities/my_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utilities/lineChart.dart';
import '../utilities/menueBelow.dart';
import '../utilities/notifications.dart';
import '../utilities/pie_chart.dart';


final Kcolors = [
  Color.fromRGBO(82, 98, 255, 1),
  Color.fromRGBO(46, 198, 255, 1),
  Color.fromRGBO(123, 201, 82, 1),
  Color.fromRGBO(255, 91, 67, 1),
  Color.fromRGBO(139, 139, 130, 1),

];

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _HomePageState();
}

class _HomePageState extends State<homePage> {
  final _controller = PageController();
  int currentIndex2 = 0;
 @override
 void initState(){
   super.initState();
    _controller.addListener(() {
      setState(() {
        currentIndex2 = _controller.page!.round();
      });
    });
 }
  final List<String> balances = ['\499', '\777', '793'];
  final List<String> cardNumbers = ['2222', '908', '654'];
  final List<String> expiryDates = ['10/24', '08/24', '01/25'];
  final List<Color> cardColors = [
    Colors.deepPurple[400]!,
    Colors.blue,
    Colors.green[400]!,
    Colors.red[400]!,
    Colors.orange[400]!,
    Colors.yellow[400]!,
    Colors.teal[400]!,
    Colors.pink[400]!,
    Colors.purple[400]!,
    Colors.indigo[400]!,
    Colors.lightBlue[400]!,
  ];


  // @HiveField(0)

  List<String> welcomeNotifications = [
    "Welcome to our app! We're excited to have you here.",
    "Hello and welcome! We hope you enjoy your time with us.",
    "Greetings! Thank you for joining us. Feel free to explore.",
    "Welcome aboard! Get ready to discover new experiences.",
    "Hi there! We're thrilled to welcome you as a new member.",
  ];

  final List<String> categories = [ 'Bills', 'Clothing','Groceries','Transportation','Entertainment'];

  // List of emojis associated with each category
  final List<String> emojis = ['💵','👕','🛒', '🚗', '🎬'];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('MMM dd').format(DateTime.now());
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(193, 214, 233, 1),
      drawer: drawer(
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Zambi, Abdul Gaffir ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                 ),
                ),
                Text(currentDate),
              ],
            ),
            // Text(currentDate),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(context: context,
                        builder: (BuildContext context){
                         return LowMenu(cardNumber: currentIndex2,);
                       }
                    );
                  },
                  child: Container(
                    height: 250,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      itemCount: balances.length,
                      itemBuilder: (context, index) {
                        print(index);
                        return returnCard(balances[index], cardNumbers[index], expiryDates[index], cardColors[index]);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Positioned(
                  bottom: 10,
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: balances.length,
                    effect: const WormEffect(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            // Notifications(),
           // LineChartWidget(),
            Container(
              height: 200,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // Make children fill the width
                children: [
                  Expanded(
                    child: TextFeild(),
                  ),
                ],
              ),
            ),


            SizedBox(height: 20),
            Expanded( // Use Expanded to allow the SingleChildScrollView to take up remaining space
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    SingleChildScrollView( // Wrap the Column with SingleChildScrollView
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Monthly Expenses',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                              letterSpacing: 1.2,
                            ),
                          ),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                           children: categories.asMap().entries.map((entry) {
                              final int index = entry.key;
                              final String category = entry.value;
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                       color: Kcolors[index],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      category,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(width: 5), // Added SizedBox for spacing
                                    Text(
                                      emojis[index], // Use emoji corresponding to the category index
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    const pieChart(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
         setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}

Widget returnCard(String balanceOne,String Cardnum, String date,Color color2){
  return MyCard(
    balance: balanceOne,
    cardNumberOne: Cardnum,
    expiryDate: date,
    color: color2,
  );
}