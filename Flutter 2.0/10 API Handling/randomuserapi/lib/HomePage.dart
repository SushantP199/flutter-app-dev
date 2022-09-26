import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:randomuserapi/UserDetails.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://randomuser.me/api/?results=50";
  bool isLoading = true;
  List randomUsersData;

  Future getRandoUsersData() async {
    var response = await http
        .get(Uri.encodeFull(this.url), headers: {"Accept": "application/json"});
    var convertStringToJson = jsonDecode(response.body);
    setState(() {
      this.randomUsersData = convertStringToJson["results"];
      this.isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getRandoUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Users"),
      ),
      body: Container(
        child: Center(
          child: (this.isLoading)
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: (this.isLoading) ? 0 : this.randomUsersData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (!this.isLoading) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return UserDetails(
                                    picture: this.randomUsersData[index]
                                        ["picture"]["large"],
                                    username: this.randomUsersData[index]
                                        ["login"]["username"],
                                    name:
                                        " ${this.randomUsersData[index]["name"]["first"]} ${this.randomUsersData[index]["name"]["last"]}",
                                    gender: this.randomUsersData[index]
                                        ["gender"],
                                    dob: this.randomUsersData[index]["dob"]
                                        ["date"],
                                    email: this.randomUsersData[index]["email"],
                                    phone: this.randomUsersData[index]["phone"],
                                    password: this.randomUsersData[index]
                                        ["login"]["password"]);
                              },
                            ),
                          );
                        }
                      },
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(10.0),
                              child: Image(
                                image: NetworkImage(this.randomUsersData[index]
                                    ["picture"]["thumbnail"]),
                                height: 70.0,
                                width: 70.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.person,
                                        color: Colors.blueAccent,
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          text:
                                              " ${this.randomUsersData[index]["name"]["first"]} ${this.randomUsersData[index]["name"]["last"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.nature_people,
                                        color: Colors.blueAccent,
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          text:
                                              " ${this.randomUsersData[index]["gender"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.phone,
                                        color: Colors.blueAccent,
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          text:
                                              " ${this.randomUsersData[index]["phone"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
