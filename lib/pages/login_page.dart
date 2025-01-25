import 'package:chat_app_firebase/components/my_button.dart';
import 'package:chat_app_firebase/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  LoginPage({super.key});

  void login() {
    String min = "Min Khant Kyaw";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Welcome back, you've been missed!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            SizedBox(
              height: 10,
            ),
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(
              text: "Login",
              onTap: login,
            ),

            SizedBox(
              height: 20,
            ),
            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                Text(
                  "Register Now",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
