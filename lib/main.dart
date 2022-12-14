import 'package:flutter/material.dart';

import 'core/slide_page_route.dart';
import 'features/animated_list_app/animated_list_app.dart';
import 'features/animated_navbar_app/animated_navbar_app.dart';
import 'features/camera_app/camera_app.dart';
import 'features/delicious_food_app/delicious_food_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  static const List<UiApp> _uiWidgets = [
    UiApp('Animated List', AnimatedListApp()),
    UiApp('Delicious Food', DeliciousFoodApp()),
    UiApp('Animated Navbar', AnimatedNavbarApp()),
    UiApp('Camera App', CameraApp()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter UI')),
      body: ListView.builder(
        itemCount: _uiWidgets.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_uiWidgets[index].title),
            onTap: () {
              Navigator.of(context).push(
                SlidePageRoute(
                  builder: (context) => _uiWidgets[index].app,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class UiApp {
  const UiApp(this.title, this.app);
  final String title;
  final Widget app;
}
