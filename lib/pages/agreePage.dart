import 'package:flutter/material.dart';

class Agreements extends StatefulWidget {
  @override
  _AgreementsState createState() => _AgreementsState();
}

class _AgreementsState extends State<Agreements> {
  bool _agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agreements'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[800],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Money Man Application Agreement",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "This Agreement is entered into by and between the user ('User') and Money Man, represented by [Company Name], the provider of the Money Man application ('App').",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "By ticking the box below, the User agrees to be bound by the terms and conditions outlined in this Agreement. If the User does not agree with any part of this Agreement, they should refrain from using the App.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "1. Acceptance of Terms",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "By downloading, installing, or using the Money Man application, the User agrees to be bound by the terms and conditions outlined in this Agreement. If the User does not agree with any part of this Agreement, they should refrain from using the App.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "2. Description of Service",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "The Money Man application is designed to assist users in managing their personal finances, including but not limited to budgeting, expense tracking, and financial goal setting. The App may also provide educational resources related to personal finance.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "3. Privacy and Security",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Money Man is committed to protecting the privacy and security of its users' personal and financial information. The App collects and processes user data in accordance with its Privacy Policy, which is available within the App and on the Money Man website.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "4. User Responsibilities",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "a. The User is responsible for providing accurate and complete information when using the App.\n"
                  "b. The User agrees not to use the App for any unlawful or fraudulent purposes.\n"
                  "c. The User is solely responsible for the security of their account credentials and agrees not to share them with third parties.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "5. Fees and Payments",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "The Money Man application may be offered free of charge or on a subscription basis. Any fees associated with the use of the App will be clearly communicated to the User prior to their acceptance of this Agreement.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "6. Intellectual Property",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "The Money Man application and all related content, including but not limited to text, graphics, logos, and software, are the intellectual property of Money Man and are protected by copyright and other intellectual property laws.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "7. Limitation of Liability",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Money Man shall not be liable for any indirect, incidental, special, or consequential damages arising out of the use or inability to use the App, including but not limited to loss of profits, data, or goodwill.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "8. Modification of Terms",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Money Man reserves the right to modify, suspend, or terminate any aspect of the App or this Agreement at any time without prior notice. Continued use of the App following any such changes constitutes acceptance of the modified terms.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "9. Governing Law",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "This Agreement shall be governed by and construed in accordance with the laws of [Jurisdiction], without regard to its conflict of law provisions.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              "10. Contact Information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "For questions or concerns regarding this Agreement or the Money Man application, please contact [Company Name] at [Contact Information].",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Checkbox(
                    value: _agreedToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreedToTerms = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 5, // Adjust flex factor as needed
                  child: Column(
                    children: [
                      Text(
                        "I have read and agree to the Money Man Application Agreement.",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/bank');
                        },
                        child: Text('Continue'),
                      ),
                      // SizedBox(height: 30,)
                    ],
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