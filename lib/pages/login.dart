import 'package:flutter/material.dart';
// import 'package:gif_image/gif_image.dart';
import 'dart:io';

class MoneyMan extends StatefulWidget {
  const MoneyMan({Key? key}) : super(key: key);

  @override
  _MoneyManState createState() => _MoneyManState();
}

class _MoneyManState extends State<MoneyMan> {
  String emailOne = '';
  String passWord = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // late GifController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = GifController(vsync: this);
  }

  Future<List<String>> readLinesFromFile(String filePath) async {
    List<String> lines = [];
    try {
      File file = File(filePath);
      if (await file.exists()) {
        Stream<List<int>> inputStream = file.openRead();
        List<int> buffer = [];
        await for (List<int> data in inputStream) {
          for (int byte in data) {
            if (byte == 10) {
              String line = String.fromCharCodes(buffer);
              lines.add(line);
              buffer.clear();
            } else {
              buffer.add(byte);
            }
          }
        }
      }
    } catch (e) {
      print('Error reading from the file: $e');
    }
    print('lines: $lines');
    return lines;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/LB.GIF'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text('LogIn'),
           centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage('assets/backCover.JPG'),
                fit: BoxFit.cover,
              ),

            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Money Man',
                        style: TextStyle(
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Welcome to new companionship..",
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        validator: (value) {
                          emailOne = value!;
                          if (value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email*',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          passWord = value!;
                          if (value.isEmpty) {
                            return 'This field is required';
                          }
                          if (value.length < 8) {
                            return 'The password must be at least 8 characters long';
                          }
                          if (!value.contains(RegExp(r'[!~@#%^&*?+/\-_]+'))) {
                            return 'The input must contain at least one symbol';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Password*',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('password: $passWord\n');
                            Navigator.pushNamed(context, '/splashOne');
                            readLinesFromFile('/Users/azamb/Desktop/userInfo.txt');
                          }
                        },
                        child: const Text('SIGN IN'),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          print('Forgot Password button pressed');
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 200,
                            width: 500,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  'Sign Up Options',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextButton.icon(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/signup');
                                  },
                                  icon: const Icon(Icons.person),
                                  label: const Text(
                                    'Personal',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
