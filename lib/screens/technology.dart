import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_basic/providers/technology_provider.dart';

import 'dart:ui';
import 'package:news_basic/screens/description.dart';

class TechPage extends StatefulWidget {
  @override
  _TechPageState createState() => _TechPageState();
}

class _TechPageState extends State<TechPage>with AutomaticKeepAliveClientMixin<TechPage> {

  ScrollController controller  = ScrollController();
  bool isShowLoader = false;
  int page = 1;
  TechNewsData techNewsData = TechNewsData();
  @override
  void initState() {
    controller.addListener(() {
      if(controller.position.maxScrollExtent == controller.position.pixels ) {
        debugPrint("AT the end");
        isShowLoader = true;
        page++;
        setState(() {

        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD ==> EntertainmentPage");
    return Scaffold(
      body: Container(
        child:
        FutureBuilder(
          future: techNewsData.fetchNews(page),
          builder: (context,data) {
            if(data!=null && data.data!=null) {
              return ListView.builder(
                controller: controller,
                itemCount: data.data!=null && data.data.length > 0 ? (isShowLoader ?  data.data.length+1 :  data.data.length) : 0 ,
                itemBuilder: (BuildContext context,int index){
                  if(index == data.data.length) {
                    return Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Card(
                      elevation: 1,
                      shadowColor: Colors.blue.shade100,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context) =>DescriptionPage(
                            news: data.data[index],
                          )));
                        },
                        child: Column(
                          children: [
                            Container(
                                height: 160,
                                width: double.infinity,
                                child: Hero(tag: data.data[index].urlToImg , child: Image.network(data.data[index].urlToImg,height: 160,fit: BoxFit.fitWidth,))),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: Text(data.data[index].title,textAlign:TextAlign.center,style: TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.w500,letterSpacing: 1
                              ),),
                            ),
                            Text("Read more->>",textAlign: TextAlign.right, style: TextStyle(fontSize: 10,color: Colors.red),)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            else {
              debugPrint("ConnectionState : ${data.connectionState}");
              switch(data.connectionState) {
                case ConnectionState.done :
                  return Center(child: CircularProgressIndicator(
                  ),);
                  break;
                case ConnectionState.active  :
                  return Center(child: CircularProgressIndicator(
                    backgroundColor: Colors.yellow,
                  ),);
                  break;
                case ConnectionState.waiting :
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                    ),
                  );
                  break;
                default :
                  return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.red,
                      ));
              }
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}