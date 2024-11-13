// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

// import 'cardsCreation/cardAddition.dart';

class BankInfo extends StatefulWidget {
  const BankInfo({Key? key}) : super(key: key);

  @override
  State<BankInfo> createState() => _BankInfoState();
}


Future<void> WriteTOfile(String Bank, String routing, String accountNumber) async {
  File file = File('/Users/azamb/Desktop/MoneyMan/$accountNumber.txt');
  try {
    // Open the file in write mode (creates the file if it doesn't exist)
    IOSink sink = file.openWrite(mode: FileMode.write);
    // Create a formatted string with the data separated by spaces
    String data = ' $Bank $routing $accountNumber\n';
    // Write the formatted data to the file
    sink.write(data);
    // Close the file
    await sink.close();
    print('Data written to the file.');
  } catch (e) {
    print('Error writing to the file: $e');
  }
}


class _BankInfoState extends State<BankInfo> {
  TextEditingController _accountNumberController = TextEditingController();
  TextEditingController _routingNumberController = TextEditingController();
  TextEditingController _bankNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Information'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Your Bank Information:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _accountNumberController,
              decoration: InputDecoration(
                labelText: 'Account Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _routingNumberController,
              decoration: InputDecoration(
                labelText: 'Routing Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _bankNameController,
              decoration: InputDecoration(
                labelText: 'Bank Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                WriteTOfile(
                  _bankNameController.text,
                  _routingNumberController.text,
                  _accountNumberController.text,
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Cards(accountNumber: _accountNumberController.text),
                //   ),
                // );
                Navigator.pushNamed(context, '/fetch');
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up controllers
    _accountNumberController.dispose();
    _routingNumberController.dispose();
    _bankNameController.dispose();
    super.dispose();
  }
}