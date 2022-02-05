import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mugwump_mania/Pages/GameWonPage.dart';

import 'GameOverPage.dart';

class GamePage extends StatefulWidget
{
  int size;
  GamePage(this.size);

  @override
  State<StatefulWidget> createState()
  {
    return GamePageState(size);
  }

}
class GamePageState extends State<GamePage>
{
  int size;
  int x = 0;
  int y = 0;
  String text = "";
  List<int> selected = [];

  GamePageState(this.size)
  {
    Random random = new Random();
    int pos = random.nextInt(size*size);
    x = pos % size;
    y = pos ~/ size;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mugwump Mania"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 15,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                padding: EdgeInsets.all(20),
                itemCount: 100,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      color: selected.contains(index)?Colors.red:Colors.blue,
                    ),
                    onTap: () {
                      playGame(index,context);
                      },
                  );
                }),
          ),
          Flexible(flex:1,child: Text(text,style: TextStyle(color: Colors.white),),),
        ],
      ),
    );
  }
  int count = 0;
  void playGame(int guess,BuildContext context)
  {
    if(count < 10)
      {
        int cy = guess % size;
        int cx = guess ~/ size;
        double dist = math.sqrt(math.pow(cx-x, 2) + math.pow(cy-y,2));
        print(dist);
        if(dist != 0.0)
          {
            setState(() {
              selected.add(guess);
              this.text = dist.toStringAsFixed(2);
            });
          }
        else
        {
          Navigator.push(context, MaterialPageRoute(builder: (context){return GameWonPage();}));
        }
        count++;
      }
    else
      {
        Navigator.push(context, MaterialPageRoute(builder: (context){return GameOverPage();}));
      }
  }
}
