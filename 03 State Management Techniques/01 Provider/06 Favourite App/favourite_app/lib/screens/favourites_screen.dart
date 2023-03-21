import 'package:favourite_app/provider/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatefulWidget {
  FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {

    print("favourite screen build");

    var itemsProvider = Provider.of<ItemsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Favourites"),
      ),
      body: ListView.builder(
        itemCount: itemsProvider.favourites.length,
        itemBuilder: (context, index) {

          print("favourite screen listview building");

          return (itemsProvider.favourites[index] == false)
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<ItemsProvider>(
                    builder: (context, value, child) {

                      print("favourite screen listtile ${index} rebuild");

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
