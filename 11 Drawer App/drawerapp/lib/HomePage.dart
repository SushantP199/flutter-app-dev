import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Drawer App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Sushant Pagam"),
              accountEmail: Text("sushantpagam@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.brown,
                child: Text("SP"),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed("/mascot"),
              leading: const Icon(Icons.image),
              title: const Text('Mascot'),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed("/profile"),
              leading: const Icon(Icons.verified_user),
              title: const Text('Profile'),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed("/category"),
              leading: const Icon(Icons.category),
              title: const Text('Category'),
            ),
            const Divider(),
            ListTile(
              onTap: () => Navigator.of(context).pop(),
              leading: const Icon(Icons.close),
              title: const Text('Close'),
            ),
          ],
        ),
      ),
      body: const Center(
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
        child: const Icon(Icons.dashboard),
      ),
    );
  }
}
