import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiceBody(),
    );
  }
}

class DiceBody extends StatefulWidget {
  @override
  _DiceBodyState createState() => _DiceBodyState();
}

class _DiceBodyState extends State<DiceBody> {
  int dice1num = 0;
  int dice2num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tavla",
        ),
        backgroundColor: Colors.green[900],
      ),
      body: buildDiceCanvas(),
    );
  }

  Widget buildDiceCanvas() {
    return SafeArea(
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    splashColor: Colors.red,
                    child: RotatedBox(
                      child: Text("Salla"),
                      quarterTurns: 2,
                    ),
                    onPressed: () {
                      rollDices();
                    },
                  ),
                ],
                //alignment: Alignment.topLeft,
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  rollDices();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /// Expanded parent must be Column Row or Flex
                    /// If child size is too big and applied Expanded ,
                    /// Every Expanded child contracts with its parent so it will fit inside the parent
                    Expanded(
                      child: buildImage(dice1num),

                      /// With flex number, all area portions  will be shared by expand widgets
                      /// ( flex 1 & flex 3 means %33-%66)
                      flex: 1,
                    ),
                    Expanded(
                      child: buildImage(dice2num),
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton(
                    splashColor: Colors.red,
                    child: RotatedBox(
                      child: Text("Salla"),
                      quarterTurns: 2,
                    ),
                    onPressed: () {
                      rollDices();
                    },
                  ),
                ],
                //alignment: Alignment.topLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void rollDices() {
    setState(() {
      dice1num = Random().nextInt(5);
      dice2num = Random().nextInt(5);
    });
  }

  buildImage(int number) {
    switch (number) {
      case 0:

        /// We can use Image.asset instead of Image(image:AssetImage())
        return Image.asset("assets/Alea_1.png");
        break;
      case 1:
        return Image.asset("assets/Alea_2.png");

        break;
      case 2:
        return Image(
          image: AssetImage("assets/Alea_3.png"),
        );
        break;
      case 3:
        return Image(
          image: AssetImage("assets/Alea_4.png"),
        );
        break;
      case 4:
        return Image(
          image: AssetImage("assets/Alea_5.png"),
        );
        break;
      case 5:
        return Image(image: AssetImage("assets/Alea_6.png"));
        break;
      default:
        return Image(image: AssetImage("assets/Alea_6.png"));
    }
  }
}

//ALTERNATİF------
/*
class DiceBody extends StatefulWidget {
  @override
  _DiceBodyState createState() => _DiceBodyState();
}

class _DiceBodyState extends State<DiceBody> {
  int dice1num = 0;
  int dice2num = 0;
  Random rnd = new Random();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: GestureDetector(
          onTap: () {
            var randNum1 = rnd.nextInt(5);
            var randNum2 = rnd.nextInt(5);
            setState(() {
              dice1num = randNum1;
              dice2num = randNum2;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: buildDecorationImage(dice1num),
                ),
                child: Text(
                  "${dice1num + 1}",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: buildDecorationImage(dice2num),
                  //shape: BoxShape.circle,
                ),
                child: Text(
                  "${dice2num + 1}",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  DecorationImage buildDecorationImage(int number) {
    switch (number) {
      case 0:
        return DecorationImage(image: AssetImage("assets/Alea_1.png"));
        break;
      case 1:
        return DecorationImage(
            image: AssetImage("assets/Alea_2.png"), fit: BoxFit.scaleDown);
        break;
      case 2:
        return DecorationImage(
            image: AssetImage("assets/Alea_3.png"), fit: BoxFit.cover);
        break;
      case 3:
        return DecorationImage(
            image: AssetImage("assets/Alea_4.png"), fit: BoxFit.cover);
        break;
      case 4:
        return DecorationImage(
            image: AssetImage("assets/Alea_5.png"), fit: BoxFit.cover);
        break;
      case 5:
        return DecorationImage(image: AssetImage("assets/Alea_6.png"));
        break;
      default:
        return DecorationImage(image: AssetImage("assets/Alea_6.png"));
    }
  }


}

*/
