import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://api.github.com/users";
  List data;

  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: (this.data != null) ? this.data.length : 0,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text(
                    this.data[index]["followers_url"],
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  subtitle: Text(
                    this.data[index]["following_url"],
                    style: TextStyle(
                      fontSize: 8.0,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<String> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(this.url),
    );
    print(this.url);
    print("\n\n\nthis.url");
	
    print(Uri.encodeFull(this.url));
	print("\n\n\nenoc");
    print(response);
    print("\n\n\n");
    print(response.body);
    setState(() {
      var convertDataToJson = json.decode(response.body);
      this.data = convertDataToJson;
    });
  }
}
