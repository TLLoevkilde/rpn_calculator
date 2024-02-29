import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpn_calculator/calculator.dart';

class calculator_screen extends StatefulWidget {
  const calculator_screen({super.key});

  @override
  State<calculator_screen> createState() => _calculator_screenState();
}

class _calculator_screenState extends State<calculator_screen> {
  String display = "";
  final Calculator calculator = Calculator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Calculator",
          style: const TextStyle(fontSize: 30),

        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(
              calculator.stack.toString(),
              key: const Key("Stack"),
              style: const TextStyle(fontSize: 24), // Større fontstørrelse
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Text(
              display,
              key: const Key("Display"),
              style: const TextStyle(fontSize: 36), // Større fontstørrelse
            ),
          ),
          Row(
            children: <Widget>[
              buildButton("7", () => insertNumber("7")),
              buildButton("8", () => insertNumber("8")),
              buildButton("9", () => insertNumber("9")),
              buildButton("-", () => subtract()),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("6", () => insertNumber("6")),
              buildButton("5", () => insertNumber("5")),
              buildButton("4", () => insertNumber("4")),
              buildButton("+", () => add()),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("3", () => insertNumber("3")),
              buildButton("2", () => insertNumber("2")),
              buildButton("1", () => insertNumber("1")),
              buildButton("x", () => multiply()),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("0", () => insertNumber("0")),
              buildButton("C", () => clear()), //
              buildButton("CE", () => clearEntry()),
              buildButton("/", () => divide()),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("Enter", () => enter()),
            ],
          )
        ],
      ),
    );
  }

  Widget buildButton(String buttonText, void Function() onPressed) {
    //add function as argument
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: FilledButton(
          key: Key(buttonText),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  insertNumber(String buttonText) {
    setState(() {
      display = int.parse(display + buttonText).toString();
    });
  }

  enter() {
    setState(() {
      calculator.push(double.parse(display));
      display = "";
    });
  }

  clear() {
    setState(() {
      calculator.stack.clear();
      display = "";
    });
  }

  clearEntry() {
    setState(() {
      if (display.isEmpty) {
        calculator.stack.removeLast();
      } else {
        display = "";
      }
    });
  }

  add() {
    setState(() {
      Addition addition = Addition();
      calculator.execute(addition);
    });
  }

  subtract() {
    setState(() {
      Subtraction subtraction = Subtraction();
      calculator.execute(subtraction);
    });
  }

  multiply() {
    setState(() {
      Multiplication multiplication = Multiplication();
      calculator.execute(multiplication);
    });
  }

  divide() {
    setState(() {
      Division division = Division();
      calculator.execute(division);
    });
  }
}
