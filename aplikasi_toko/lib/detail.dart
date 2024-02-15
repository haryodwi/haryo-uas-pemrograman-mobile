import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './editdata.dart';
import 'AdminPage.dart';

class Detail extends StatefulWidget {
  final List list;
  final int index;

  Detail({Key? key, required this.index, required this.list});

  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void DeleteData() {
    var url = Uri.parse("http://localhost/unsia/deletedata.php");

    http.post(url, body: {
      'id': widget.list[widget.index]['id'],
    });
  }

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
          "Apakah Anda yakin ingin menghapus '${widget.list[widget.index]['nama_item']}' ?"),
      actions: <Widget>[
        MaterialButton(
          child: Text("OK DELETE"),
          color: Colors.red,
          onPressed: () {
            DeleteData();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => AdminPage(),
            ));
          },
        ),
        MaterialButton(
          child: Text("CANCEL"),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("${widget.list[widget.index]['nama_item']}")),
      body: new Container(
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text(
                  widget.list[widget.index]['nama_item'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Text(
                  "Kode Item : ${widget.list[widget.index]['kode_item']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Stok : ${widget.list[widget.index]['stok']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Center(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        child: new Text("EDIT"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => EditData(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                      SizedBox(
                          width: 16), // Tambahkan sedikit spasi antara tombol
                      ElevatedButton(
                        child: new Text("DELETE"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () => confirm(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
