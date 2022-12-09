import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalc extends StatefulWidget {
  @override
  _SimpleCalcState createState() => _SimpleCalcState();
}

class _SimpleCalcState extends State<SimpleCalc> {
  TextEditingController num1 = TextEditingController();
  TextEditingController operator = TextEditingController();
  TextEditingController num2 = TextEditingController();
  String ans = '';
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double txt = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 38, 63, 154),
          title: const Text("Calculator"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(40),
            children: [
              ListTile(
                title: Text("Home",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber)),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/');
                },
              ),
              ListTile(
                title: const Text(
                  "Weather",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/weather');
                },
              ),
              ListTile(
                title: const Text(
                  "Calculator",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/calc');
                },
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //1st number
                Container(
                  padding: EdgeInsets.all(10 * txt),
                  width: w * 0.35,
                  child: TextFormField(
                    cursorColor: Color.fromARGB(255, 22, 59, 117),
                    controller: num1,
                    onChanged: (val) {
                      setState(() {
                        num1.text = val;
                        num1.selection = TextSelection.fromPosition(
                          TextPosition(offset: num1.text.length),
                        );
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '1st number',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
                //operator
                Container(
                  padding: EdgeInsets.all(10 * txt),
                  width: w * 0.25,
                  child: TextFormField(
                    cursorColor: Color.fromARGB(255, 17, 55, 124),
                    controller: operator,
                    onChanged: (val) {
                      setState(() {
                        operator.text = val;
                        operator.selection = TextSelection.fromPosition(
                          TextPosition(offset: operator.text.length),
                        );
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'operation(+ , - , * , /)',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
                //2nd number
                Container(
                  padding: EdgeInsets.all(10 * txt),
                  width: w * 0.35,
                  child: TextFormField(
                    cursorColor: Color.fromARGB(255, 0, 70, 150),
                    controller: num2,
                    onChanged: (val) {
                      setState(() {
                        num2.text = val;
                        num2.selection = TextSelection.fromPosition(
                          TextPosition(offset: num2.text.length),
                        );
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '2nd number',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: h * 0.4,
              child: Center(
                child: Text(
                  ans == '' ? 'Your answer will be displayed here' : ans,
                  style: TextStyle(
                    fontSize: ans == '' ? 16 * txt : 25 * txt,
                    color: ans == ''
                        ? Colors.grey.shade400
                        : Color.fromARGB(255, 112, 7, 218),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: w * 0.4,
                  height: h * 0.08,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 16, 152, 205),
                    ),
                    onPressed: () {
                      ans = calc();
                      setState(() {});
                    },
                    child: Text('CALCULATE'),
                  ),
                ),
                SizedBox(
                  width: w * 0.4,
                  height: h * 0.08,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 16, 152, 205),
                    ),
                    onPressed: () {
                      ans = '';
                      num1.clear();
                      num2.clear();
                      operator.clear();
                      setState(() {});
                    },
                    child: Text('CLEAR'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    num1.dispose();
    num2.dispose();
    operator.dispose();
    super.dispose();
  }

  String calc() {
    Parser p = Parser();
    Expression e = p.parse('${num1.text + operator.text + num2.text}');
    ContextModel cm = ContextModel();
    num ans = e.evaluate(EvaluationType.REAL, cm);
    return ans.toString().length > 10
        ? ans.toStringAsPrecision(3)
        : ans.toString();
  }
}
