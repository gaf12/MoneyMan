import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List<Map<String, dynamic>> myImages = [
    {
      'imagePath': 'assets/card.jpg',
      'text': 'Add Your Card/Bank',
    },
    {
      'imagePath': 'assets/manage.jpg',
      'text': 'Keep Track of Spending',
    },
    {
      'imagePath': 'assets/grow.jpg',
      'text': 'Grow Your Money',
    },
  ];

  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 400,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CarouselSlider.builder(
                      itemCount: myImages.length,
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 200,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                        autoPlayInterval: const Duration(seconds: 2),
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentImage = index;
                          });
                        },
                      ),
                      itemBuilder: (BuildContext context, int index,
                          int realIndex) =>
                          Image.asset(
                            myImages[index]['imagePath'],
                            fit: BoxFit.cover,
                          ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          myImages[currentImage]['text'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: currentImage,
                  count: myImages.length,
                  effect: const ExpandingDotsEffect(
                    spacing: 5,
                    dotHeight: 8,
                    dotWidth: 8,
                    dotColor: Colors.grey,
                 ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {

                },
                child: const Text(
                  'Create Account',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50), backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/splashOne');
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue, padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
