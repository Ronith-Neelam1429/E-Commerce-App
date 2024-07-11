import 'package:e_commerce/components/button.dart';
import 'package:e_commerce/components/textField.dart';
import 'package:e_commerce/firebase/auth/authentication.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void register() async {
    final _authservice = Authentication();
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await _authservice.signUp(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
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
            // Logo
            const Icon(
              Icons.lock_open_rounded,
              size: 72,
            ),
            const SizedBox(height: 25),

            // message. app slogan
            Text(
              "Let's create an account for you!",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),

            // email textfield
            MyTextfield(
                controller: emailController,
                hintText: "Email",
                obscureText: false),
            const SizedBox(height: 10),
            // password textfield
            MyTextfield(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),
            const SizedBox(height: 10),
            MyTextfield(
                controller: confirmPasswordController,
                hintText: "Confirm password",
                obscureText: true),

            // sign in button
            const SizedBox(height: 25),

            MyButton(
                onTap: () {
                  register();
                },
                text: "Sign Up"),
            // not a member? register now
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already a member?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "Login here",
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
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
