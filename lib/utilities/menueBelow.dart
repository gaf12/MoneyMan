import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LowMenu extends StatefulWidget {
  final int cardNumber;
  LowMenu({required this.cardNumber});

@override
  State<LowMenu> createState() => _LowMenuState();
}

final Map<String, ImageProvider> imageIcon = {
  'T': AssetImage('assets/air.jpg'),
  'SOne': AssetImage('assets/bags.jpg'),
  // 'G': AssetImage('assets/trolley.jpg'),
  'G': AssetImage('assets/shopping.jpg'),
  'C': AssetImage('assets/shirts.jpg'),
  'M': AssetImage('assets/music.jpg'),
  'F': AssetImage('assets/burger.jpg'),
};

final List<String> item = [
  'DELTA Flight T',
  'SHEIN C',
  'WALMART G',
  'PETE G',
  'ROSS C',
  'APPLE MUSIC M',
  'BURGER KING F',
];

final Map<String, String> categories = {
  'T': "Transportation",
  'F' : "Food",
  'SOne' : "Entertainment",
  'G' : "Groceries",
  'C': "Clothes",
  'M': "Music",
};

final List<String> amount = [
  '\$50',
  '\$500',
  '\$900',
  '\$10',
  '\$200',
  '\$100',
  '\$150',
];

class _LowMenuState extends State<LowMenu> {
  final dataBaseTwo = Hive.box("MoneyManData");

  List<String> returnItems(int number){
    List<String> myBox = dataBaseTwo.get(number);
    return myBox;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.cardNumber);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color:Colors.black12,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Today",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.add),
                  )
                ],
              ),
            ),
          ),
          // Divider(
          //   color:Colors.black12,
          // ),
          Container(
            height: 400,
            decoration: BoxDecoration(
              color: Colors.black12,
              shape: BoxShape.rectangle,
            ),
            child: ListView(
              children: item.asMap().entries.map((entry) {
                List<String> words = [];
                String toDo = '';
                String itemFollow = '';
                final int index = entry.key;
                final String itemOne = entry.value;
                for (int i = 0; i < itemOne.length;i++) {
                  words = itemOne.split(' ');
                }
                if (words.length >= 3){
                  for (int i = 0;i < words.length - 1;i++ ){
                    toDo += '${words[i]} ';
                  }
                  itemFollow = words[words.length -1];
                }
                else{
                  toDo = words[0];
                  itemFollow = words[1];
                }
                toDo.trim();
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                // margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: imageIcon[itemFollow]!,
                                    fit: BoxFit.contain,
                                 ),
                                ),
                                alignment: Alignment.center,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    toDo,
                                    style: TextStyle(
                                     fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(categories[itemFollow]!,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          // Divider(),
                          Text(
                            amount[index],
                            style: TextStyle(
                              fontSize: 17,
                             fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
