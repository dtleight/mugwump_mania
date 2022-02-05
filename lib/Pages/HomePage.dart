import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mugwump_mania/Pages/GamePage.dart';

class HomePage extends StatelessWidget
{
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 5,),
            TextField(controller: controller, decoration: InputDecoration(fillColor: Colors.white, filled: true),),
            Spacer(flex: 1,),
            TextButton(
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context){return GamePage(int.parse(controller.value.text.toString()));})); },
              child: Text("Start Game",style: TextStyle(color: Colors.white),),
            ),
            Spacer(),
            TextButton(
                onPressed: (){exit(0);},
                child: Text("Quit",style: TextStyle(color:Colors.red),)),
            Spacer(flex: 5,)
          ],
        ),
      ),
    );
  }
}