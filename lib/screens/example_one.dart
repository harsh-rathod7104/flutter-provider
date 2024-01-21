import 'package:flutter/material.dart';
import 'package:flutter_getx/provider/example_one_provider.dart';
import 'package:provider/provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    final sliderProvider =
        Provider.of<ExampleOneProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(
              builder: (context, sliderProvider, child) {
            print("Only this widget build");
            return Slider(
                min: 0,
                max: 1,
                value: sliderProvider.value,
                onChanged: (newValue) {
                  sliderProvider.setValue(newValue);
                });
          }),
          Consumer<ExampleOneProvider>(
              builder: (context, sliderProvider, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(sliderProvider.value),
                    ),
                    child: const Center(
                      child: Text("Container 1"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(sliderProvider.value),
                    ),
                    child: const Center(
                      child: Text("Container 1"),
                    ),
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
