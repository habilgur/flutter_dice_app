import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[900],
        body: DiceBody(),
      ),
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
