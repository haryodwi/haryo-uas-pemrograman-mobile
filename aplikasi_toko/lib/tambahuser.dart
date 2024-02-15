import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class TambahUser extends StatefulWidget {
  @override
  _TambahUserState createState() => _TambahUserState();
}

class _TambahUserState extends State<TambahUser> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  // TextEditingController controllerLevel = TextEditingController();

  String? level;
  List<String> levelOptions = ['admin', 'pengguna'];

  void TambahUser() {
    var url = Uri.parse("http://localhost/unsia/tambahuser.php");

    http.post(url, body: {
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "level": level!,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Akun"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              TextField(
                controller: controllerUsername,
                decoration: InputDecoration(
                    hintText: "Username", labelText: "Username"),
              ),
              TextField(
                controller: controllerPassword,
                decoration: InputDecoration(
                    hintText: "Password", labelText: "Password"),
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'level',
                ),
                value: level,
                items: levelOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    level = newValue;
                  });
                },
              ),
              // TextField(
              //   controller: controllerLevel,
              //   decoration: InputDecoration(
              //       hintText: "admin or pengguna", labelText: "Level"),
              // ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              MaterialButton(
                child: Text("DAFTAR"),
                color: Colors.blueAccent,
                onPressed: () {
                  TambahUser();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  ).then((value) => setState(() {}));
                },
              )
            ],
          )),
    );
  }
}
