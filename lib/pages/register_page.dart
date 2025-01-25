import 'package:chat_app_firebase/auth/auth_service.dart';
import 'package:chat_app_firebase/components/my_button.dart';
import 'package:chat_app_firebase/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    final _auth = AuthService();
    if (_pwController.text == _confirmPwController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Passwords don't match!"),
              ));
    }
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
              "Let's create an account for you!",
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
              height: 10,
            ),
            MyTextfield(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmPwController,
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),

            SizedBox(
              height: 20,
            ),
            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Logins Now",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
