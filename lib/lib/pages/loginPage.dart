import 'package:e_commerce/components/my_button.dart';
import 'package:e_commerce/components/my_textField.dart';
import 'package:e_commerce/pages/homePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login method
 void login() {
  // fill out authentication here

  // navigate to the home screen
  Navigator.push(
    context, MaterialPageRoute(builder: (context) => const HomePage(),),
  );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body:  Center(
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
              "E-Commerce Delivery App",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),

            // email textfield
            MyTextfield(controller: emailController, hintText: "Email", obscureText: false),
            const SizedBox(height: 10),
            // password textfield
            MyTextfield(controller: passwordController, hintText: "Password", obscureText: true),
            // sign in button
            const SizedBox(height: 25),

            MyButton(onTap: () {
              login();
            }, text: "Sign In"),
            // not a member? register now
            const SizedBox(height: 25),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?", 
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),),
                const SizedBox(width: 4,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "Register now", 
                    style: TextStyle(
                      color: Colors.blueAccent, 
                      fontWeight: FontWeight.bold
                    ),
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