import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helper/ApiHandler.dart';
import '../models/Example.dart';
import '../resources/URLResources.dart';

class Examplescreens extends StatefulWidget {
  const Examplescreens({Key? key}) : super(key: key);

  @override
  State<Examplescreens> createState() => _ExamplescreensState();
}

class _ExamplescreensState extends State<Examplescreens> {
  List<Example>? allproducts;
  bool isloded = false;

   getdata() async {

     setState(() {
       isloded = true;
     });
     ApiHandler.getCall(URLResources.BASE_URL_EXAMPLE).then((json) {
       setState(() {
         allproducts =
             json['data'].map<Example>((obj) => Example.fromJson(obj)).toList();
         isloded = false;
       });
       return json;
     });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Example Api"),
        ),
        body:  (isloded)
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
          itemCount: allproducts!.length,
          itemBuilder: (context, index) {
            var dt = allproducts![index].date.toString();
            //Logic
            //string convert to date
            DateTime dateTime = DateTime.parse(dt);
            // date format
            dt = DateFormat.MMMMEEEEd().format(dateTime);
            //current date
            DateTime currentdate = DateTime.now();
            // diffrence between current date and enddate
            final difference = dateTime.difference(currentdate).inDays;

            //  split 2 title
            var title = allproducts![index].name.toString().split(",");
            var s1 = title[0];
            var s2="";
            if(title.length>=2)
              {
               s2=title[1];
              }

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Container(
                  height: 100.0,
                  color: Colors.brown.shade50,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(dt),
                        SizedBox(width: 20.0,),
                        Text(difference.toString()+" days"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(s1.toString()),
                        ],
                      ),
                      (s2!="")?Row(
                        children: [
                          Text(s2.toString()),
                        ],
                      ):SizedBox(),
                      // Text(allproducts![index].date.toString()),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
