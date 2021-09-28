import 'package:flutter/material.dart';
import 'package:news_basic/menu.dart';
import 'package:news_basic/screens/business.dart';
import 'package:news_basic/screens/health.dart';
import 'package:news_basic/screens/sports.dart';
import 'package:news_basic/screens/technology.dart';
import 'package:news_basic/screens/entertainment.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  EntertainmentPage entPage = EntertainmentPage();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD ==> HOME");
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Inshorts"),
            backgroundColor: Colors.deepOrangeAccent.shade200,
            bottom: TabBar
              (isScrollable:true,
              onTap: (newIndex) {
                debugPrint("NEWINDEX $newIndex");
                currentIndex = newIndex;
                setState(() {
                });
              },
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.mobile_friendly),text:"Entertainment",),
                Tab(icon: Icon(Icons.computer),text:"Technology",),
                Tab(icon: Icon(Icons.monetization_on),text:"Business",),
                Tab(icon: Icon(Icons.medical_services),text:"Health",),
                Tab(icon: Icon(Icons.sports_handball),text:"Sports",)
              ],),
          ),
          drawer: menuOption(),
          body: TabBarView(
            children: [
              EntertainmentPage(),
              TechPage(),
              BusinessPage(),
              HealthPage(),
              SportsPage(),
            ],
          )
        ),
      ),
    );
  }
}
