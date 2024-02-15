import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'AdminPage.dart';

class TambahData extends StatefulWidget {
  @override
  _TambahDataState createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  TextEditingController controllerKode = TextEditingController();
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerHarga = TextEditingController();
  TextEditingController controllerStok = TextEditingController();

  void TambahData() {
    var url = Uri.parse("http://localhost/unsia/tambahdata.php");

    http.post(url, body: {
      "kode_item": controllerKode.text,
      "nama_item": controllerNama.text,
      "harga": controllerHarga.text,
      "stok": controllerStok.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              TextField(
                controller: controllerKode,
                decoration: InputDecoration(
                    hintText: "Kode Item", labelText: "Kode Item"),
              ),
              TextField(
                controller: controllerNama,
                decoration: InputDecoration(
                    hintText: "Nama Item", labelText: "nama Item"),
              ),
              TextField(
                controller: controllerHarga,
                decoration:
                    InputDecoration(hintText: "Harga", labelText: "harga"),
              ),
              TextField(
                controller: controllerStok,
                decoration:
                    InputDecoration(hintText: "Stok", labelText: "Stock"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              MaterialButton(
                child: Text("TAMBAH DATA"),
                color: Colors.blueAccent,
                onPressed: () {
                  TambahData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminPage()),
                  ).then((value) => setState(() {}));
                },
              )
            ],
          )),
    );
  }
}
