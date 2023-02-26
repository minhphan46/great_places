import 'package:flutter/material.dart';
import 'package:great_places/router/app_routers.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your places"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.addPlaceScreen);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
