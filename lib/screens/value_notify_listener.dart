import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: _obscureText,
              builder: ((context, value, child) {
                return TextFormField(
                  obscureText: _obscureText.value,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                      onPressed: () {
                        _obscureText.value = !_obscureText.value;
                      },
                      icon: Icon(
                        _obscureText.value
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                );
              })),
          Center(
            child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Text(
                  _counter.value.toString(),
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
