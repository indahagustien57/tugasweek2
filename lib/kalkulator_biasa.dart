import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanHome(),
    ));

class HalamanHome extends StatefulWidget {
  @override
  _HalamanHomeState createState() => _HalamanHomeState();
}

class _HalamanHomeState extends State<HalamanHome> {
  String Output = "0";
  String _out = "0";
  double angkaPertama = 0.0;
  double angkaKedua = 0.0;
  String operand = "";

  PressedButton(String nilai) {
    print(nilai);
    if (nilai == "C") {
      _out = "0";
      angkaPertama = 0;
      angkaKedua = 0;
      operand = "";
    } else if (nilai == "+" ||
        nilai == "-" ||
        nilai == "*" ||
        nilai == "/" ||
        nilai == "e") {
      angkaPertama = double.parse(Output);
      operand = nilai;
      _out = "0";
      Output = Output + nilai;
    } else if (nilai == ".") {
      if (_out.contains(".")) {
        return;
      } else {
        _out = _out + nilai;
      }
    } else if (nilai == "=") {
      angkaKedua = double.parse(Output);
      if (operand == "+") {
        _out = (angkaPertama + angkaKedua).toString();
      }
      if (operand == "-") {
        _out = (angkaPertama - angkaKedua).toString();
      }
      if (operand == "*") {
        _out = (angkaPertama * angkaKedua).toString();
      }
      if (operand == "/") {
        _out = (angkaPertama / angkaKedua).toString();
      }
      if (operand == "e") {
        _out = pow(angkaPertama, angkaKedua).toString();
      }
      angkaPertama = 0.0;
      angkaKedua = 0.0;
    } else {
      _out = _out + nilai;
    }
    setState(() {
      Output = double.parse(_out).toStringAsFixed(2);
    });
  }

  Widget tombolKalkulator(String nilaiTombol) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: Colors.pink[200], boxShadow: [
        BoxShadow(
          color: Colors.pink[300],
          offset: Offset(2.0, 2.0),
          blurRadius: 8.0,
          spreadRadius: 1.0,
        ),
        BoxShadow(
          color: Colors.white,
          offset: Offset(-2.0, -2.0),
          blurRadius: 8.0,
          spreadRadius: 1.0,
        )
      ]),
      child: MaterialButton(
        padding: EdgeInsets.all(30.0),
        child: Text(
          nilaiTombol,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        onPressed: () => PressedButton(nilaiTombol),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink[100],
        body: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                child: Text(
                  Output,
                  style: TextStyle(fontSize: 35),
                ),
              ),
              Expanded(child: Divider()),
              Column(
                children: [
                  Row(
                    children: [
                      tombolKalkulator("."),
                      tombolKalkulator("C"),
                      tombolKalkulator("e"),
                      tombolKalkulator("*"),
                    ],
                  ),
                  Row(
                    children: [
                      tombolKalkulator("7"),
                      tombolKalkulator("8"),
                      tombolKalkulator("9"),
                      tombolKalkulator("/"),
                    ],
                  ),
                  Row(
                    children: [
                      tombolKalkulator("4"),
                      tombolKalkulator("5"),
                      tombolKalkulator("6"),
                      tombolKalkulator("+"),
                    ],
                  ),
                  Row(
                    children: [
                      tombolKalkulator("1"),
                      tombolKalkulator("2"),
                      tombolKalkulator("3"),
                      tombolKalkulator("-"),
                    ],
                  ),
                  Row(
                    children: [
                      tombolKalkulator("0"),
                      tombolKalkulator("="),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
