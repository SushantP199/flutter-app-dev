import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Drawer App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Sushant Pagam"),
              accountEmail: Text("sushantpagam@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.brown,
                child: Text("SP"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              onTap: ()=>Navigator.of(context).pushNamed("/mascot"),
              leading: Icon(Icons.image),
              title: Text('Mascot'),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed("/profile"),
              leading: Icon(Icons.verified_user),
              title: Text('Profile'),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed("/category"),
              leading: Icon(Icons.category),
              title: Text('Category'),
            ),
            Divider(),
            ListTile(
              onTap: () => Navigator.of(context).pop(),
              leading: Icon(Icons.close),
              title: Text('Close'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Home Page",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 30.0,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.dashboard),
      ),
    );
  }
}
