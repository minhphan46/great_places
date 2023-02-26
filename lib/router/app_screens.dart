import 'package:flutter/material.dart';
import 'package:great_places/router/app_routers.dart';
import 'package:great_places/app/screens/add_play_screen.dart';

class AppScreens {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.addPlaceScreen: (context) => AddPlayScreen(),
  };
}
