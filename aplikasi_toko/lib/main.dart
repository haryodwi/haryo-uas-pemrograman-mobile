import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'AdminPage.dart';
import 'PenggunaPage.dart';
import 'tambahuser.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toko Haryo',
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        'MyHomePage': (BuildContext context) => new MyHomePage(),
        'AdminPage': (BuildContext context) => new AdminPage(),
        'PenggunaPage': (BuildContext context) => new PenggunaPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  String message = '';

  Future<void> _login() async {
    final response =
        await http.post(Uri.parse("http://localhost/unsia/login.php"), body: {
      "username": username.text,
      "password": password.text,
    });
    var datauser = json.decode(response.body);
    if (datauser.length == 0) {
      setState(() {
        message = "Login Gagal";
      });
    } else {
      if (datauser[0]['level'] == 'admin') {
        Navigator.pushReplacementNamed(context, 'AdminPage');
      } else if (datauser[0]['level'] == 'pengguna') {
        Navigator.pushReplacementNamed(context, 'PenggunaPage');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Haryo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                    child: Container(
                        width: 200,
                        height: 150,
                        child: Image.asset("images/hero.png")))),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Username",
                      hintText: "Masukkan Username"),
                  controller: username,
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      hintText: "Masukkan Password"),
                  controller: password,
                )),
            Container(
              margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(15)),
              child: TextButton(
                onPressed: () {
                  // Navigasi ke halaman Home
                  _login();
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => TambahUser(),
                  ));
                },
                child: Text("Daftar Akun",
                    style: TextStyle(color: Colors.blue, fontSize: 15)))
          ],
        ),
      ),
    );
  }
}
