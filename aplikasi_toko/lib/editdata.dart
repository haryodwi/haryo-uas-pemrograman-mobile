import 'package:flutter/material.dart';
import 'AdminPage.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({Key? key, required this.index, required this.list});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerKode;
  late TextEditingController controllerNama;
  late TextEditingController controllerHarga;
  late TextEditingController controllerStok;

  void EditData() {
    var url = Uri.parse("http://localhost/unsia/editdata.php");

    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "kode_item": controllerKode.text,
      "nama_item": controllerNama.text,
      "harga": controllerHarga.text,
      "stok": controllerStok.text,
    });
  }

  @override
  void initState() {
    controllerKode =
        TextEditingController(text: widget.list[widget.index]['kode_item']);
    controllerNama =
        TextEditingController(text: widget.list[widget.index]['nama_item']);
    controllerHarga =
        TextEditingController(text: widget.list[widget.index]['harga']);
    controllerStok =
        TextEditingController(text: widget.list[widget.index]['stok']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: controllerKode,
                  decoration: InputDecoration(
                      hintText: "Kode Item", labelText: "Kode Item"),
                ),
                TextField(
                  controller: controllerNama,
                  decoration: InputDecoration(
                      hintText: "Nama Item", labelText: "Nama Item"),
                ),
                TextField(
                  controller: controllerHarga,
                  decoration:
                      InputDecoration(hintText: "Harga", labelText: "Harga"),
                ),
                TextField(
                  controller: controllerStok,
                  decoration:
                      InputDecoration(hintText: "Stok", labelText: "Stok"),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                MaterialButton(
                  child: Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    EditData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => AdminPage()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
