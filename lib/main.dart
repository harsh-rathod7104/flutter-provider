import 'package:flutter/material.dart';
import 'package:flutter_getx/provider/count_provider.dart';
import 'package:flutter_getx/screens/count_example.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
        home: CountExample(),
      ),
    );
  }
}
