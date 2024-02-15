import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Toko Haryo",
    home: PenggunaPage(),
  ));
}

class PenggunaPage extends StatefulWidget {
  @override
  _PenggunaPageState createState() => _PenggunaPageState();
}

class _PenggunaPageState extends State<PenggunaPage> {
  Future<List> getData() async {
    final response =
        await http.get(Uri.parse("http://localhost/unsia/getdata.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Welcome Pengguna'),
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton(
              onSelected: (result) {
                if (result == 0) {
                  Navigator.pushReplacementNamed(context, 'MyHomePage');
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('Logout'),
                  value: 0,
                ),
              ],
            )
          ]),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemList(list: snapshot.data ?? [])
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // ignore: unnecessary_null_comparison
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: ListTile(
                title: Text(list[i]['nama_item']),
                leading: Icon(Icons.shopping_cart_sharp),
                subtitle: Text("Stok : ${list[i]['stok']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
