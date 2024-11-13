import 'package:flutter/material.dart';
class MyCard extends StatelessWidget {
  final String balance;
  final String cardNumberOne;
  final String expiryDate;
  final Color color;

  const MyCard({
    Key? key,
    required this.balance,
    required this.cardNumberOne,
    required this.expiryDate,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
           offset: Offset(0, 3),
          ),
        ],
      ),
      // height: 500,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage('assets/vC.jpg'),
                  height: 35,
                  width: 35,
                           ),
                SizedBox(width: 25,),
                Text("Master Card",style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20
                ),),
              ],
            ),
            SizedBox(height: 25,),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Balance',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '\$$balance',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                 ],
                ),
                SizedBox(width: 213,),
                Image(
                  image: AssetImage('assets/p.jpg'),
                  height: 55,
                  width: 50,
                ),
              ],
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Card Number: *** $cardNumberOne',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Expiry Date: $expiryDate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
