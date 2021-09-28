import 'package:flutter/material.dart';
import 'package:news_basic/providers/business_provider.dart';
import 'package:news_basic/providers/health_provider.dart';
import 'package:news_basic/providers/sports_provider.dart';
import 'package:news_basic/providers/technology_provider.dart';
import 'package:news_basic/screens/entertainment.dart';
import 'package:news_basic/screens/sports.dart';
import 'home.dart';
import 'providers/entertainment_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

