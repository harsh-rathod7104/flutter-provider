import 'package:flutter/material.dart';
import 'package:flutter_getx/provider/theme_changer.dart';
import 'package:provider/provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    print("build");
    final themeChangeProvider =
        Provider.of<ThemeChangeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Changer"),
      ),
      body: Column(children: [
        RadioListTile<ThemeMode>(
          title: Text("Light Mode"),
          value: ThemeMode.light,
          groupValue: themeChangeProvider.themeMode,
          onChanged: (themeMode) {
            themeChangeProvider.setTheme(themeMode);
          },
        ),
        RadioListTile<ThemeMode>(
          title: Text("Dark Mode"),
          value: ThemeMode.dark,
          groupValue: themeChangeProvider.themeMode,
          onChanged: (themeMode) {
            themeChangeProvider.setTheme(themeMode);
          },
        ),
        RadioListTile<ThemeMode>(
          title: Text("System Mode"),
          value: ThemeMode.system,
          groupValue: themeChangeProvider.themeMode,
          onChanged: (themeMode) {
            themeChangeProvider.setTheme(themeMode);
          },
        ),
      ]),
    );
  }
}
