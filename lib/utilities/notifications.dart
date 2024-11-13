import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> welcomeNotifications = [
  "Welcome to our app! We're excited to have you here.",
];

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 200,
        padding: EdgeInsets.all(8.0),
        // margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
             blurRadius: 5,
              offset: Offset(0, 3),
            ),

          ],
        ),
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Notifications: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 5), // Add spacing between title and notifications
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: welcomeNotifications.asMap().entries.map((entry) {
                  final index = entry.key;
                  final notification = entry.value;
                  return Text(
                    notification,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  );

                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
