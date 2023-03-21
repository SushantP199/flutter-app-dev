import 'package:favourite_app/provider/items_provider.dart';
import 'package:favourite_app/screens/favourites_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  final int itemCount = 20;

  @override
  Widget build(BuildContext context) {
    print("item screen build");

    var itemsProvider = Provider.of<ItemsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider | State Management"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return FavouritesScreen();
                    },
                  ),
                );
              },
              icon: Icon(Icons.favorite, size: 30,),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {

          itemsProvider.favourites.add(false);
          print("listview building...");

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<ItemsProvider>(
              builder: (context, value, child) {
                
                print("rebuild listtile ${index}");

                return ListTile(
                  onTap: () {
                    itemsProvider.setFavourites(index);
                  },
                  title: Text("item ${index}"),
                  trailing: itemsProvider.favourites[index]
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border_outlined),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
