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
    // update data
    notifyListeners();
    // insert
    DBHelper.insert(DBHelper.nameDB, {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    // get data
    final dataList = await DBHelper.getData(DBHelper.nameDB);
    // convert map to place
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item["title"],
            image: File(item["image"]),
            location: null,
          ),
        )
        .toList();
    // update data
    notifyListeners();
  }
}
