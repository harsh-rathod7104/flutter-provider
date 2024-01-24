import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  setLoaing(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _obscure = true;
  bool get obscure => _obscure;

  setVisibility() {
    _obscure = !_obscure;
    print(_obscure);
  }

  void login(String email, String password) async {
    setLoaing(true);
    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/login"), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        print("Successfull");
        setLoaing(false);
      } else {
        print("failed");
        setLoaing(false);
      }
    } catch (e) {
      print(e.toString());
      setLoaing(false);
    }
  }
}
