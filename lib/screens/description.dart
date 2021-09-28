import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/news.dart';

class DescriptionPage extends StatefulWidget {
  final News news;
  final valueKey;
  DescriptionPage({this.news,this.valueKey});
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {

  @override
  void initState() {
    debugPrint("TAG ${widget.news.urlToImg}");
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Hero(tag: widget.valueKey,
                child: Center(child: Image.network(widget.news.urlToImg,height: 200,fit: BoxFit.fitWidth,))),
            SizedBox(
              height:5 ,
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(widget.news.content,style: TextStyle(fontSize: 15,letterSpacing: 1,fontWeight: FontWeight.w400),),
            )
          ],
        ),
      ),
    );
  }
}
