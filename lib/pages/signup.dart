import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:new_money/signup.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
// box

  @override
  State<SignUp> createState() => _SignUpState();
}


Future<void> WriteTOfileSignup(
   String firstName, String lastName, String email, String password) async {
  print('here');
  final file = File('/Users/azamb/Desktop/MoneyMan/userInfoOne.txt');
  try {
    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    IOSink sink = file.openWrite(mode: FileMode.append);
    String data = '$firstName $lastName $email $password\n';
    sink.write(data);
    await sink.flush();
    await sink.close();
    // print('Data written to the file.');
  } catch (e) {
    print('Error writing to the file: $e');
  }
}


class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final dataBase = Hive.box('MoneyManData');
// write
  void writeToDatabase(String firstName, String lastName, String email, String password){
    String key = passWord;
   dataBase.put(key, [firstName,lastName,email,password]);
   // print(dataBase.get(key));
  }

//read to data Base
  List<String> readFromDataBase(String key){
    List<String> data = dataBase.get(key);
  return data;
  }



  String email = '';
  String firstName = '';
  String passWord = '';
  String lastName = '';

  void _submitForm() {

    if (_formKey.currentState!.validate()) {
      WriteTOfileSignup(firstName, lastName, email, passWord);
      writeToDatabase(firstName, lastName, email, passWord);
    }
    Navigator.pushNamed(context, '/Agree');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Money Man',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sign up for the best experience',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            firstName = value;
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'First Name',
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }
                            lastName = value;
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Invalid email address';
                      }
                      email = value;
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email*',
                    ),
                  ),
                  SizedBox(width: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      passWord = value;
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password*',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      if (passWord != value) {
                        return 'Password doesn\'t match';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Confirm Password*',
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Select Country',
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Sign Up'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Have an account already?'),
            SizedBox(width: 10),
            TextButton(
              onPressed: () {
                // Navigate to sign-in page
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}