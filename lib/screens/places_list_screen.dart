import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Consumer<GreatPlaces>(
          child: Center(
            child: const Text('Got no places yet.'),
          ),
          builder: (builderContext, greatPlaces, child) =>
              greatPlaces.items.length <= 0
                  ? child
                  : ListView.builder(
                      itemBuilder: (builderContext, index) => ListTile(
                        leading: CircleAvatar(
                          backgroundImage: FileImage(greatPlaces.items[index].image,),
                        ),
                        title: Text(greatPlaces.items[index].title),
                        onTap: () {},
                      ),
                      itemCount: greatPlaces.items.length,
                    ),
        ),
      ),
    );
  }
}
