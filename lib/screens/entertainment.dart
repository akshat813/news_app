import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:news_basic/providers/entertainment_provider.dart';
import 'package:news_basic/screens/description.dart';

class EntertainmentPage extends StatefulWidget {
  @override
  _EntertainmentPageState createState() => _EntertainmentPageState();
}

class _EntertainmentPageState extends State<EntertainmentPage>with AutomaticKeepAliveClientMixin<EntertainmentPage> {

  ScrollController controller  = ScrollController();
  bool isShowLoader = false;
  int page = 1;
  EntertainmentNewsData entertainmentNewsData = EntertainmentNewsData();
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
          future: entertainmentNewsData.fetchAlbum(page),
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
                  ValueKey valueKey = ValueKey(DateTime.now().millisecondsSinceEpoch);
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Card(
                      elevation: 1,
                      shadowColor: Colors.blue.shade100,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context) =>DescriptionPage(
                            news: data.data[index],
                              valueKey:valueKey
                          )));
                        },
                        child: Column(
                          children: [
                            Container(
                                height: 160,
                                width: double.infinity,
                                child: Hero(tag: valueKey , child: Image.network(data.data[index].urlToImg,height: 160,fit: BoxFit.fitWidth,))),
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