import 'package:flutter/material.dart';
import 'package:main/components/calc_buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  int index = 2;
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userQuestion = '';
  var userAnswer = '';

  final myTextStyle = TextStyle(
      fontSize: 30, color: Colors.lightBlue[900], fontWeight: FontWeight.bold);

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Kalkulator',
          ),
        ),
        backgroundColor: Colors.lightBlue[900],
        body: Column(children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    userQuestion,
                    style:
                        TextStyle(fontSize: 20, color: Colors.lightBlue[100]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userAnswer,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    //clear button
                    if (index == 0) {
                      return CalcButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestion = '';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.green,
                        textColor: Colors.white,
                      );
                    }

                    //delete button
                    else if (index == 1) {
                      return CalcButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestion = userQuestion.substring(
                                0, userQuestion.length - 1);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.red,
                        textColor: Colors.white,
                      );
                    }

                    //equal button
                    else if (index == buttons.length - 1) {
                      return CalcButton(
                        buttonTapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.lightBlue[800],
                        textColor: Colors.white,
                      );
                    } else {
                      return CalcButton(
                        buttonTapped: () {
                          setState(() {
                            userQuestion += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.lightBlue[800]
                            : Colors.lightBlue[50],
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.lightBlue[800],
                      );
                    }
                  }),
            ),
          ),
        ]),
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   index: 0,
      //   onIndexChanged: (int 1) {
      // setState(() {
      // index = 1;
      // });
      // },
      // ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;

    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
