import 'package:simple_calculator/calc_button.dart';
import 'package:flutter/material.dart';

import 'calc_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var operator = '';
  var text = '0';

  insertNumber(value) {
    setState(() {
      if (text == '0' || text == 'Infinity') {
        text = value.toString();
      } else {
        text += value.toString();
      }
    });
  }

  setOperator(newOperator) {
    setState(() {
      if (operator != '') {
        calculate();
        text += newOperator.toString();
        operator = newOperator;
      } else {
        text += newOperator.toString();
        operator = newOperator;
      }
    });
  }

  calculate() {
    var data = text.split(operator);

    var number1 = data[0];
    var number2 = data[1];

    setState(() {
      switch(operator) {
        case '*':
          text = (double.parse(number1) * double.parse(number2)).toStringAsFixed(1);
          break;
        case '/':
          text = (double.parse(number1) / double.parse(number2)).toStringAsFixed(1);
          break;
        case '-':
          text = (double.parse(number1) - double.parse(number2)).toStringAsFixed(1);
          break;
        case '+':
          text = (double.parse(number1) + double.parse(number2)).toStringAsFixed(1);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double screenSize = 290;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Flutter Calculator"),
        surfaceTintColor: Colors.purple,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        height: size.height,
        color: Colors.purpleAccent,
        child: Column(
          children: [
            Container(
                color: Colors.indigoAccent,
                height: screenSize,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(text,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 70
                      ),
                    ),
                  ],
                )
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Divider(color: Colors.indigo, height: 5),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              color: Colors.indigo,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: CalcButton(
                            color: Colors.blue,
                            onItemTap: () {
                              insertNumber(7);
                            },
                            text: "7",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.blue,
                            onItemTap: () {
                              insertNumber(8);
                            },
                            text: "8",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.blue,
                            onItemTap: () {
                              insertNumber(9);
                            },
                            text: "9",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.yellow,
                            textColor: Colors.black,
                            onItemTap: () {
                              setOperator('/');
                            },
                            text: "÷",
                          )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CalcButton(
                            color: Colors.blue,
                            onItemTap: () {
                              insertNumber(4);
                            },
                            text: "4",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.blue,
                            onItemTap: () {
                              insertNumber(5);
                            },
                            text: "5",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.blue,
                            onItemTap: () {
                              insertNumber(6);
                            },
                            text: "6",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.yellow,
                            textColor: Colors.black,
                            onItemTap: () {
                              setOperator('*');
                            },
                            text: "×",
                          )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CalcButton(
                            color: Colors.blue,
                            onItemTap: () {
                              insertNumber(1);
                            },
                            text: "1",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.blue,
                            onItemTap: () {
                              insertNumber(2);
                            },
                            text: "2",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.blue,
                            onItemTap: () {
                              insertNumber(3);
                            },
                            text: "3",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.yellow,
                            textColor: Colors.black,
                            onItemTap: () {
                              setOperator('+');
                            },
                            text: "+",
                          )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CalcButton(
                            color: Colors.blue,
                            onItemTap: () {
                              insertNumber(0);
                            },
                            text: "0",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.yellow,
                            textColor: Colors.black,
                            onItemTap: () {
                              setState(() {
                                text = '0';
                                operator = '';
                              });
                            },
                            text: "CE",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                           color: Colors.yellow,
                            textColor: Colors.black,
                            onItemTap: () {
                              calculate();
                            },
                            text: "=",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.yellow,
                            onItemTap: () {
                              setOperator('-');
                            },
                            text: "-",
                          )
                         )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CalcButton(
                            color: Colors.yellow,
                            onItemTap: () {
                              insertNumber('.');
                            },
                            text: ".",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.yellow,
                            onItemTap: () {
                              setOperator('(');
                            },
                            text: "(",
                          )
                      ),
                      Expanded(
                          child: CalcButton(
                            color: Colors.yellow,
                            onItemTap: () {
                              setOperator(')');
                            },
                            text: ")",
                          )
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}