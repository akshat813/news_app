import 'package:flutter/material.dart';
import 'screens/about.dart';

class menuOption extends StatelessWidget {
  @override
   build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:<Widget> [
          DrawerHeader(child: Container(margin:EdgeInsets.only(top: 40) ,child: Text('Welcome to inshorts',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent.shade200,
            ),),
          ListTile(
            title: Text("About"),
            onTap: ()
            {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>aboutPage()));
            },
          )
        ],
      ),
    );
  }
}


