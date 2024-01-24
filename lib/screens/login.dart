import 'package:flutter/material.dart';
import 'package:flutter_getx/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email  ",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer<AuthProvider>(
              builder: ((context, value, child) {
                return TextFormField(
                  obscureText: value.obscure,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffix: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        value.setVisibility();
                      },
                    ),
                  ),
                );
              }),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                authProvider.login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: authProvider.loading
                      ? CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : Text("Login"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
