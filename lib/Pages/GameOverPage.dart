import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameOverPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(child: Column(
        children: [
          Spacer(),
          Text("You Lost",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white),),
          TextButton(onPressed: (){Navigator.pop(context);Navigator.pop(context);}, child: Text("Return Home")),
          Spacer(),
        ],
      )),

    );
  }

}