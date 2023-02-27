import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/app/helpers/db_helper.dart';
import 'package:great_places/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickerTitle, File pickerImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: pickerTitle,
      location: null,
      image: pickerImage,
    );

    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image,
    });
  }
}
