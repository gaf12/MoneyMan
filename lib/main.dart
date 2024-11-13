



import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'package:new_money/pages/accountPage.dart';
import 'package:new_money/pages/agreePage.dart';
import 'package:new_money/pages/bankDetails.dart';
import 'package:new_money/pages/login.dart';
import 'package:new_money/pages/signup.dart';
import 'package:new_money/pages/textingFEild.dart';
import 'package:new_money/splash/mainSplash.dart';
import 'package:new_money/splash/mainSplashBank.dart';


import 'package:new_money/splash/splash.dart';
import 'package:new_money/splash/splashBank.dart';
import 'package:new_money/utilities/pie_chart.dart';

// import 'accountPage.dart';
import 'cardsCreation/addCard.dart';
import 'cardsCreation/cardAddition.dart';
// import 'cardClicked.dart';
import 'cardsCreation/cardClicked.dart';
import 'pages/firstPage.dart';
import 'pages/homePage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  // hive
  await Hive.initFlutter();
  //open Hive
  var box = Hive.openBox("MoneyManData");

   runApp(MaterialApp(
   // hiv
  debugShowCheckedModeBanner: false,

  initialRoute: '/',
  routes:{
    // '/' : (context) => TextFeild(),
    // '/': (context) => const bankSpil(),
    '/' : (context) => const MoneyMan(),
    '/cards' : (context) => Cards(accountNumber: '2222',),
    // 'money': (context) => const MoneyMan(),
    '/signup': (context) =>const SignUp(),
    '/splashOne' : (context) => const Splash(),
    '/accountPage' : (context) => const accoutHolder(),
    '/Agree' : (context) => Agreements(),
    '/bank' : (context) => const BankInfo(),
    '/fetch' : (context) => const SplashBank(),
    '/card' : (context) =>  setLimit(accountNumber: '777',),
    '/add' : (context) => CreditCardPage(goToPage: 1,),
    // '/workingPage' : (context) => const homePage(),
    '/' : (context) => const homePageSplash(),
  } ,
));}