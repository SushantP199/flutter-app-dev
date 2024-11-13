import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:random_user/UserDetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://randomuser.me/api/?results=50";
  bool isLoading = true;
  late List randomUsersData;

  Future getRandoUsersData() async {
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    var convertStringToJson = jsonDecode(response.body);
    setState(() {
      randomUsersData = convertStringToJson["results"];
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getRandoUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Users"),
      ),
      body: Center(
        child: (isLoading)
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: (isLoading) ? 0 : randomUsersData.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (!isLoading) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return UserDetails(
                                picture: randomUsersData[index]["picture"]
                                    ["large"],
                                username: randomUsersData[index]["login"]
                                    ["username"],
                                name:
                                    " ${randomUsersData[index]["name"]["first"]} ${randomUsersData[index]["name"]["last"]}",
                                gender: randomUsersData[index]["gender"],
                                dob: randomUsersData[index]["dob"]["date"],
                                email: randomUsersData[index]["email"],
                                phone: randomUsersData[index]["phone"],
                                password: randomUsersData[index]["login"]
                                    ["password"],
                              );
                            },
                          ),
                        );
                      }
                    },
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image(
                                image: NetworkImage(
                                  randomUsersData[index]["picture"]
                                      ["thumbnail"],
                                ),
                                height: 70.0,
                                width: 70.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.person,
                                      color: Colors.blueGrey,
                                      size: 20,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text:
                                            " ${randomUsersData[index]["name"]["first"]} ${randomUsersData[index]["name"]["last"]}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.nature_people,
                                      color: Colors.blueGrey,
                                      size: 20,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text:
                                            " ${randomUsersData[index]["gender"]}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.phone,
                                      color: Colors.blueGrey,
                                      size: 20,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text:
                                            " ${randomUsersData[index]["phone"]}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                        ),
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
    );
  }
}
