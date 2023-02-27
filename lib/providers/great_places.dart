import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/app/helpers/db_helper.dart';
import 'package:great_places/app/helpers/location_helper.dart';
import 'package:great_places/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Place findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addPlace(String pickerTitle, File pickerImage,
      PlaceLocation pickerLocation) async {
    // get name of address
    final address = await LocationHelper.getPlaceAddress(
        pickerLocation.latitude, pickerLocation.longitude);
    // update location with name of address
    final updatedLocation = PlaceLocation(
      latitude: pickerLocation.latitude,
      longitude: pickerLocation.longitude,
      address: address,
    );

    final newPlace = Place(
      id: DateTime.now().toString(),
      title: pickerTitle,
      location: updatedLocation,
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
      'loc_lat': newPlace.location!.latitude,
      'loc_lng': newPlace.location!.longitude,
      'address': newPlace.location!.address!,
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
            location: PlaceLocation(
              latitude: item['loc_lat'],
              longitude: item['loc_lng'],
              address: item['address'],
            ),
          ),
        )
        .toList();
    // update data
    notifyListeners();
  }
}
