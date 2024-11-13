import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:new_money/signup.dart';



class CreditCardPage extends StatefulWidget {
  final int goToPage;
  CreditCardPage({required this.goToPage});
  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}


Future<void> WriteTOfileCardNum(
    String cardNumber, String expiryDate, String cardHolderName, String cvvCode) async {
  File file = File('/Users/azamb/Desktop/MoneyMan/$cardHolderName.txt');
  try {
    // Open the file in write mode (creates the file if it doesn't exist)
    IOSink sink = file.openWrite(mode: FileMode.write);
    // Create a formatted string with the data separated by spaces
    String data = '$cardHolderName $cardNumber $expiryDate $cvvCode\n';
    // Write the formatted data to the file
    sink.write(data);
    // Close the file
    await sink.close();
    print('Data written to the file.');
  } catch (e) {
    print('Error writing to the file: $e');
  }
}

class _CreditCardPageState extends State<CreditCardPage> {
  String cardNumber = '';
  String expiryDate= '';
  String cardHolderName = '';
  String cvvCode= '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('ADD NEW CARD'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        onCreditCardModelChange: onCreditCardModelChange,
                        themeColor: Colors.blue,
                        formKey: formKey,
                        cardNumberDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Number',
                            hintText: 'xxxx xxxx xxxx xxxx'
                        ),
                        expiryDateDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expired Date',
                            hintText: 'xx/xx'
                        ),
                        cvvCodeDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'xxx'
                        ),
                        cardHolderDecoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Card Holder',
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ), backgroundColor: Color(0xff1b447b)

                        ),
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          child: Text(
                            'Add Card',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'halter',
                              fontSize: 14,
                              package: 'flutter_credit_card',
                            ),
                          ),
                        ),
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            WriteTOfileCardNum(cardNumber,expiryDate, cardHolderName, cvvCode);
                            Navigator.pop(context,cardHolderName);
                          }
                        },
                      ),

                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel){
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}