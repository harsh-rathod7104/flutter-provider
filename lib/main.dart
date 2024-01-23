import 'package:flutter/material.dart';
import 'package:flutter_getx/provider/count_provider.dart';
import 'package:flutter_getx/provider/example_one_provider.dart';
import 'package:flutter_getx/provider/favourite_provider.dart';
import 'package:flutter_getx/provider/theme_changer.dart';
import 'package:flutter_getx/screens/count_example.dart';
import 'package:flutter_getx/screens/dark_theme.dart';
import 'package:flutter_getx/screens/example_one.dart';
import 'package:flutter_getx/screens/favourite/favourite_screen.dart';
import 'package:flutter_getx/screens/value_notify_listener.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangeProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChangeProvider =
              Provider.of<ThemeChangeProvider>(context, listen: false);
          return MaterialApp(
            themeMode: themeChangeProvider.themeMode,
            theme: ThemeData(
              useMaterial3: false,
            ),
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: NotifyListenerScreen(),
          );
        },
      ),
    );
  }
}
