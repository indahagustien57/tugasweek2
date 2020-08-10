import 'package:flutter/material.dart';

class BMICalc extends StatefulWidget {
  @override
  _BMICalcState createState() => _BMICalcState();
}

class _BMICalcState extends State<BMICalc> {
  double _perhitunganBMI;
  String _hasilPerhitungan;
  String _cetakHasil;

  TextEditingController _usiaController = new TextEditingController();
  TextEditingController _tinggiBadanController = new TextEditingController();
  TextEditingController _beratBadanController = new TextEditingController();

  void _calculateBMI() {
    double tinggiBadan = double.parse(_tinggiBadanController.text);
    double beratBadan = double.parse(_beratBadanController.text);

    if (tinggiBadan != null && beratBadan != null) {
      setState(() {
        tinggiBadan = tinggiBadan;
        _perhitunganBMI = (beratBadan / (tinggiBadan * tinggiBadan));
        _hasilPerhitungan = _perhitunganBMI.toStringAsFixed(2);

        if (_perhitunganBMI < 18.5) {
          _cetakHasil = "Kurus";
        } else if (_perhitunganBMI >= 18.5 && _perhitunganBMI <= 24.9) {
          _cetakHasil = "Sedang";
        } else if (_perhitunganBMI >= 25.0 && _perhitunganBMI <= 29.9) {
          _cetakHasil = "Gendut";
        } else {
          _cetakHasil = "Obesitas";
          ;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Kalkulator BMI"),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(5, 15, 5, 15),
        child: ListView(
          children: [
            Container(
              child: Image.asset(
                "assets/images/fitness.png",
                width: 300,
                height: 300,
              ),
            ),
            Container(
              color: Colors.black26,
              padding: EdgeInsets.all(3.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _usiaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'masukkan umur anda (dalam tahun)',
                      icon: Icon(Icons.calendar_today),
                    ),
                  ),
                  TextField(
                    controller: _tinggiBadanController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'masukkan tinggi badan anda (dalam meter)',
                      icon: Icon(Icons.book),
                    ),
                  ),
                  TextField(
                    controller: _beratBadanController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "masukkan berat badan anda (dalam kg)",
                      icon: Icon(Icons.local_drink),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(3.0)),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.blue[300],
                    elevation: 10,
                    onPressed: _calculateBMI,
                    child: Text("Hitung BMI"),
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(3.0)),
            SizedBox(height: 5),
            Container(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Nilai BMI kamu adalah ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _hasilPerhitungan != null ? '$_hasilPerhitungan' : '',
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                "Category kamu adalah ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Center(
              child: Text(
                _cetakHasil != null ? '$_cetakHasil' : '',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
