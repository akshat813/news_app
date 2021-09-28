import 'package:flutter/material.dart';

class aboutPage extends StatefulWidget {
  @override
  _aboutPageState createState() => _aboutPageState();
}

class _aboutPageState extends State<aboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.deepOrangeAccent.shade200,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Text("DEVELOPER -> AKSHAT GUPTA"+"\n"+ "API USED -> newsapi.org",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic), ),
        ),
      ),
    );
  }
}
