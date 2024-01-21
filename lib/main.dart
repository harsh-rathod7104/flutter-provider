import 'package:flutter/material.dart';
import 'package:flutter_getx/provider/count_provider.dart';
import 'package:flutter_getx/provider/example_one_provider.dart';
import 'package:flutter_getx/screens/count_example.dart';
import 'package:flutter_getx/screens/example_one.dart';
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
        ChangeNotifierProvider(create: (_) => ExampleOneProvider())
      ],
      child: MaterialApp(
        home: ExampleOneScreen(),
      ),
    );
  }
}
