
import 'package:exampleapi/screens/Examplescreens.dart';
import 'package:flutter/material.dart';

class bottomnavigationscreen extends StatefulWidget {
  const bottomnavigationscreen({Key? key}) : super(key: key);

  @override
  State<bottomnavigationscreen> createState() => _bottomnavigationscreenState();
}

class _bottomnavigationscreenState extends State<bottomnavigationscreen> {
  var selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: (selected==0)?Examplescreens():SizedBox(),
          ),
          Container(
            color: Colors.yellow,
            padding: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 0;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: (selected == 0) ? Colors.green : Colors.black,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          color: (selected == 0) ? Colors.green : Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 1;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.supervised_user_circle,
                        color: (selected == 1) ? Colors.green : Colors.black,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("About")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 2;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(Icons.shopping_cart),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("Shop")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = 3;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("Settings")
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
