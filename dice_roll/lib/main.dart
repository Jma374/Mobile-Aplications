import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceRollMain());
}

// MaterialApp widget
class DiceRollMain extends StatelessWidget {
  const DiceRollMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceRoll(),
    );
  }
}
// end MaterialApp

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  int diceOne = 1;
  int diceTwo = 1;
  int diceSum = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Dice Roll",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold)),
            backgroundColor: Colors.amber),
        body: Center(
            child: Column(children: [
          TextButton(
              onPressed: () => setState(() {
                    diceOne = Random().nextInt(6) + 1;
                    diceSum = diceOne + diceTwo;
                  }),
              style: TextButton.styleFrom(minimumSize: Size(50, 50)),
              child: Image.asset(
                "images/dice-$diceOne.png",
                width: 200,
                height: 200,
              )),
          TextButton(
            onPressed: () => setState(() {
              diceTwo = Random().nextInt(6) + 1;
              diceSum = diceOne + diceTwo;
            }),
            child: Image.asset(
              "images/dice-$diceTwo.png",
              width: 200,
              height: 200,
            ),
          ),
          Text("sum is $diceSum", style: TextStyle(fontSize: 40))
        ])));
  }
}
