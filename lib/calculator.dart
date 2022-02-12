
import 'package:flutter/material.dart';

class Colculator extends StatefulWidget {
  @override
  _ColculatorState createState() => _ColculatorState();
}

class _ColculatorState extends State<Colculator> {
  String result = '0';
  String finalResult = '0';
  double n1 = 0.0;
  double n2 = 0.0;
  String opr = '';
  buttontop(String btnVal) {
    if (btnVal == 'C') {
      finalResult = '0';
      n1 = 0.0;
      n2 = 0.0;
      opr = '';
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == '+' ||
        btnVal == 'x' ||
        btnVal == '/') {
      n1 = double.parse(result);
      opr = btnVal;
      finalResult = '0';
      result = result + btnVal;
    } else if (btnVal == '.') {
      if (finalResult.contains('.')) {
      } else {
        finalResult = finalResult + btnVal;
      }
    } else if (btnVal == '+/-') {
      if (result.toString().contains('-')) {
        result.toString().substring(1);
        finalResult = result;
      } else {
        result = '-' + result;
        finalResult = result;
      }
    } else if (btnVal == '%') {
      n2 = double.parse(result);
      finalResult = (n2 / 100).toString();
    } else if (btnVal == '=') {
      n2 = double.parse(result);
      if (opr == '+') {
        finalResult = (n1 + n2).toString();
      }
      if (opr == '-') {
        finalResult = (n1 - n2).toString();
      }
      if (opr == 'x') {
        finalResult = (n1 * n2).toString();
      }
      if (opr == '/') {
        finalResult = (n1 / n2).toString();
      }
    } else {
      finalResult = finalResult + btnVal;
    }
    setState(() {
      result = double.parse(finalResult).toString();
    });
  }

  Widget buttonForm(
      String textButton, Color textColor, Color backgroundButton) {
    if (textButton != '0') {
      return RawMaterialButton(
        onPressed: () {
          buttontop(textButton);
        },
        shape: const CircleBorder(),
        fillColor: backgroundButton,
        padding: const EdgeInsets.all(10),
        child: Text(
          textButton,
          style: TextStyle(
            fontSize: 30,
            color: textColor,
          ),
        ),
      );
    } else {
      return RawMaterialButton(
        onPressed: () {
          buttontop(textButton);
        },
        shape: const StadiumBorder(),
        fillColor: backgroundButton,
        padding: const EdgeInsets.fromLTRB(34, 20, 100, 10),
        child: Text(
          textButton,
          style: TextStyle(
            fontSize: 30,
            color: textColor,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              // width: 20,
              height: 120,
              // color: Colors.white,
              child: Wrap(
                children: [
                  Text(
                    finalResult,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm('C', Colors.white, Colors.blue),
                buttonForm('+/-', Colors.white, Colors.blue),
                buttonForm('%', Colors.white, Colors.blue),
                buttonForm('/', Colors.blue, Colors.white),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm('7', Colors.white, Colors.blue),
                buttonForm('8', Colors.white, Colors.blue),
                buttonForm('9', Colors.white, Colors.blue),
                buttonForm('x', Colors.blue, Colors.white),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm('4', Colors.white, Colors.blue),
                buttonForm('5', Colors.white, Colors.blue),
                buttonForm('6', Colors.white, Colors.blue),
                buttonForm('-', Colors.blue, Colors.white),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm('1', Colors.white, Colors.blue),
                buttonForm('2', Colors.white, Colors.blue),
                buttonForm('3', Colors.white, Colors.blue),
                buttonForm('+', Colors.blue, Colors.white),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buttonForm('0', Colors.white, Colors.blue),
                buttonForm('.', Colors.white, Colors.blue),
                buttonForm('=', Colors.blue, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
