import 'package:flutter/material.dart';
import 'package:flutter_getx/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class MyFavourite extends StatefulWidget {
  const MyFavourite({super.key});

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite items"),
      ),
      body: Consumer<FavouriteProvider>(
        builder: (context, favouriteProvider, child) {
          return ListView.builder(
            itemCount: favouriteProvider.favItem.length,
            itemBuilder: (context, index) {
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
            },
          );
        },
      ),
    );
  }
}
