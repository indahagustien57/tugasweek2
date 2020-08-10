import 'package:flutter/material.dart';
import 'page_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageLogin(),
    );
  }
}

class PageLogin extends StatelessWidget {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String nUsername, nPassword;

  //menambahkan form

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Halaman Login'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              width: 400,
              height: 150,
              child: Image.network(
                  "https://www.udacoding.com/wp-content/uploads/2018/09/linked3-copy-8.png"),
            ),
            SizedBox(height: 20),
            Container(
                child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextFormField(
                      //seandainya jika username tidak diisi
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Anda belum memasukkan username';
                        }
                        return null;
                      },
                      controller: myUsernameController,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Username',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextFormField(
                      ////seandainya jika username tidak diisi
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Anda belum memasukkan password';
                        }
                        return null;
                      },

                      controller: myPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Masukkan Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(130, 0, 130, 0),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      minWidth: 200,
                      height: 40,
                      color: Colors.green,
                      elevation: 15,
                      textColor: Colors.white,
                      onPressed: () {
                        //cek apakah username & passwordnya = admin
                        //kalo bukan , ada pesan error yang ditampilkan

                        //ngambil value dari widget textfield
                        nUsername = myUsernameController.text;
                        nPassword = myPasswordController.text;

                        if (_formKey.currentState.validate()) {
                          if (nUsername != 'admin') {
                            print("username salah");
                          } else if (nPassword != 'admin') {
                            print("passwordnya salah sayankkk coba lagi gih ");
                          } else {
                            //pindah halaman menuju halaman PageHome
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PageHome(
                                          nama: nUsername,
                                          password: nPassword,
                                        )));
                          }
                        }
                      },
                      child: Text('SIGN IN'),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.green,
                        child: Text("Register"),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.fromLTRB(65, 0, 40, 0),
                    child: Text(
                      "PT Koding Teknologi Asia",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(170, 0, 40, 0),
                    child: Text(
                      "2020",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
