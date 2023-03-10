import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/router/app_screens.dart';
import 'package:great_places/app/screens/places_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

/* void main() => runApp(
      DevicePreview(
        enabled: true,
        tools: [
          ...DevicePreview.defaultTools,
        ],
        builder: (context) => const MyApp(),
      ),
    ); */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        //useInheritedMediaQuery: true,
        //locale: DevicePreview.locale(context),
        //builder: DevicePreview.appBuilder,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          /* colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.amber,
          ), */
        ),
        home: PlacesListScreen(),
        routes: AppScreens.routes,
      ),
    );
  }
}
