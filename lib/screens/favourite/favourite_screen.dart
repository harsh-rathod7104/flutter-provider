import 'package:flutter/material.dart';
import 'package:flutter_getx/provider/favourite_provider.dart';
import 'package:flutter_getx/screens/favourite/myfavourite_screen.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite screen"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyFavourite()));
              },
              icon: Icon(Icons.favorite))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Consumer<FavouriteProvider>(
                  builder: (context, favouriteProvider, child) {
                return ListTile(
                  onTap: () {
                    if (favouriteProvider.favItem.contains(index)) {
                      favouriteProvider.removeFav(index);
                    } else {
                      favouriteProvider.addFav(index);
                    }
                  },
                  title: Text("Item ${index}"),
                  trailing: favouriteProvider.favItem.contains(index)
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border_outlined),
                );
              });
            },
          ))
        ],
      ),
    );
  }
}
