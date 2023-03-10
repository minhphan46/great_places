import 'package:flutter/material.dart';
import 'package:great_places/app/screens/place_detail_screen.dart';
import 'package:great_places/router/app_routers.dart';
import 'package:great_places/app/screens/add_play_screen.dart';
import 'package:path/path.dart';

class AppScreens {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.addPlaceScreen: (context) => AddPlayScreen(),
    AppRoutes.placeDetailScreen: (context) => PlaceDetailScreen(),
  };
}
