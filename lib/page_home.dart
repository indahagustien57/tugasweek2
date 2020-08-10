import 'package:ceklogin_sederhana/bmiCalc.dart';
import 'package:ceklogin_sederhana/kalkulator_biasa.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class PageHome extends StatefulWidget {
  final String nama;
  final String password;

  //constructor

  PageHome({Key key, @required this.nama, @required this.password})
      : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Home'), backgroundColor: Colors.blue),
      body: ListView(
        children: <Widget>[
          Center(child: Text('selamat datang: ${widget.nama}')),
          Center(child: Text('password : ' + widget.password)),
          SizedBox(height: 200),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.amber,
                  elevation: 15,
                  child: Text("kalkulator Sederhana"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HalamanHome()));
                  },
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.blue[300],
                  elevation: 15,
                  child: Text("kalkulator BMI"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BMICalc()));
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 100),
          Container(
            margin: EdgeInsets.fromLTRB(100, 0, 100, 0),
            height: 40,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.green,
              elevation: 15,
              textColor: Colors.white,
              child: Text("SIGN OUT"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageLogin()));
              },
            ),
          )
        ],
      ),
    );
  }
}
