
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:io';

// import 'package:new_money/bankDetails.dart';
// import 'package:new_money/cardClicked.dart';

import 'cardClicked.dart';

class Cards extends StatelessWidget {
  final String accountNumber;
  Cards({required this.accountNumber});

  @override
  Widget build(BuildContext context) {
    List<String> accountInfo =[];
    String newWord = '';
    Random random = Random();
    int randomNumber = random.nextInt(8951) + 600;
    String lastFourNumber = '';
    for (int i = accountNumber.length - 4; i < accountNumber.length; i++) {
      if (i >= 0) {
        lastFourNumber += accountNumber[i];
      }
    }

    Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(

        title: Text(
          "Card Ending In 4982: ",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        content: TextField(
          decoration: InputDecoration(
            hintText: 'Enter your Limit'
          ),
        ),
        actions: [
          TextButton(
              onPressed: (){}, child: Text("Submit")
          )
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Bank Details"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your Account Ending in: $lastFourNumber",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Has a Balance of: \$$randomNumber",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "Card/Cards linked to the account:",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true, // Ensures that the ListView only occupies the space it needs
              itemCount: 2, // Adjust the count as per your data
              itemBuilder: (context, index) {
                int sum = 1;
                generateCardInfo(accountNumber + sum.toString());
                newWord = accountNumber + sum.toString();
                sum++;
               // Placeholder for card info
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text("Card ${index + 1}"),
                    subtitle: Text("Card Info Placeholder"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      print("newWord: " + newWord);
                      accountInfo.add(newWord);
                      // setLimit(accountNumber: "676767");
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => setLimit(accountNumber: newWord),
                      //   ),
                      // );
                      openDialog();
                    },
                  ),
                );
              },
            ),
            Text("Click on any card to set limit on card"),
            SizedBox(height: 20), // Add space between cards and button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add');
              },
              child: Text("Add New Card"),
            ),
            SizedBox(height: 300),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/homePageSplash');
            }, child: const Text('Continue'))
          ],

        ),
      ),
    );

  }
}
Future<void> WriteTOfileTwo(
    String cardNumber, String expiryDate,String cvvCode,String path) async {
  File file = File('/Users/azamb/Desktop/$path.txt');
  try {
    // Open the file in write mode (creates the file if it doesn't exist)
    IOSink sink = file.openWrite(mode: FileMode.write);
    // Create a formatted string with the data separated by spaces
    String data = '$cardNumber $expiryDate $cvvCode\n';
    // Write the formatted data to the file
    sink.write(data);
    // Close the file
    await sink.close();
    // print('Data written to the file.');
  } catch (e) {
    print('Error writing to the file: $e');
  }
}



void generateCardInfo(String name) {
  Random random = Random();
  // Generate a random 16-digit account number
  String accountNumber = '';
  for (int i = 0; i < 16; i++) {
    accountNumber += random.nextInt(10).toString();
  }
  // Generate a random 3-digit CVV
  String cvv = '';
  for (int i = 0; i < 3; i++) {
    cvv += random.nextInt(10).toString();
  }
  // Generate a random expiry date (MM/YY)
  int currentMonth = DateTime.now().month;
  int currentYear = DateTime.now().year % 100; // Get last two digits of the current year
  int expiryMonth = random.nextInt(12) + 1; // Random month between 1 and 12
  int expiryYear = random.nextInt(10) + currentYear; // Random year between current year and next 10 years
  if (expiryMonth < currentMonth || (expiryMonth == currentMonth && expiryYear == currentYear)) {
    // If expiry month is before current month or it's the current month and the expiry year is the current year,
    // generate a new expiry month and year
    expiryMonth = random.nextInt(12 - currentMonth + 1) + currentMonth; // Random month between current month and December
    expiryYear = random.nextInt(10) + currentYear + 1; // Random year between next year and next 10 years
  }
  // Format expiry month and year as MM/YY
  String expiryDate = '${expiryMonth.toString().padLeft(2, '0')}/${expiryYear.toString().padLeft(2, '0')}';
  // Print the generated card information
  WriteTOfileTwo(accountNumber,expiryDate,cvv,name);
}