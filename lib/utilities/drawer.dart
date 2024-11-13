import 'package:flutter/material.dart';

import '../cardsCreation/addCard.dart';

class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,

        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Zambi, Abdul Gaffir'),
            accountEmail: Text("azamb2@uic.edu"),
            currentAccountPicture: Container(

              child: Icon(
                Icons.person,
                size: 40,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              height: 50,
            ),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.credit_card,
            ),
            title: Text("Add Card"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CreditCardPage( goToPage: 2,)));
              },
          ),
         ListTile(
           leading: Icon(
             Icons.camera,
           ),
           title: Text("Add Reciept"),
           onTap: () => Navigator.pushNamed(context, 'routeName'),
         ),
          ListTile(
            leading: Icon(
              Icons.receipt,
            ),
            title: Text("View Reciept"),
            onTap: () => Navigator.pushNamed(context, 'routeName'),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text("Settings"),
            onTap: () => Navigator.pushNamed(context, 'routeName'),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
            ),
            title: Text("Log Out"),
            onTap: () => Navigator.pushNamed(context, 'routeName'),
          ),
        ],
      ),
    );
  }
}
