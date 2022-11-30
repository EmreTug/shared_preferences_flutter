

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

void save(String text) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("text", text);
}

Future read() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var result = await prefs.getString("text");
   if (result == null) {
        text = "No saved data found";
        
     
      }
      
       else {
        text = result;
      }

}
TextEditingController input=TextEditingController();
class DemoView extends StatefulWidget {
  const DemoView({super.key});

  @override
  State<DemoView> createState() => _DemoViewState();
}

  String text = "";

class _DemoViewState extends State<DemoView> {

  @override
  void initState() {
    super.initState();
     read().then((value) {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor:Colors.blueGrey[100],

      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  decoration: TextDecoration.none)),
   Container(
              margin: EdgeInsets.only(top: 25),
              height: 30,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.grey),
              child: 
              Center(child: 
              TextField(
                controller: input
                ,textAlign: TextAlign.start,
      autofocus: true,
      style: TextStyle(color: Colors.white, fontSize: 18),
      decoration: InputDecoration.collapsed(
        hintText: "Write something",
        hintStyle: TextStyle(fontSize: 18),
        border: InputBorder.none,
      ),
      maxLines: 1,
    )),
            ),
       
          GestureDetector(
            onTap: () async{
              save(input.text);
              text=input.text;
               setState(() {});
            },
            child: 
            Container(
              margin: EdgeInsets.only(top: 25),
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
              child: Center(child: Text(
                
                "Kaydet",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 15,
                  
                ),
                textAlign: TextAlign.center,
              ),),
            ),
          )
        ],
      ),
    ),);
  }
}
