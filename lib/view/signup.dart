import 'package:flutter/material.dart';
import 'package:food_app/auth/auth.dart';
import 'package:food_app/components/button.dart';
import 'package:food_app/components/textfield.dart';
import 'package:food_app/view/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final mailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            Icon(
              Icons.lock_outline_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            Text(
              'Food Delievery App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            MyTextField(
              controller: mailcontroller,
              hintText: 'Email',
              obsecureText: false,
            ),
            MyTextField(
              controller: passwordcontroller,
              hintText: 'Password',
              obsecureText: false,
            ),
            MyTextField(
              controller: confirmcontroller,
              hintText: 'Confirm Password',
              obsecureText: false,
            ),
            MyButton(
              ontap: () {
                Auth().register(
                  context,
                  email: mailcontroller.text,
                  password: passwordcontroller.text,
                );
              },
              text: 'Sign Up',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already member?  '),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: LoginPage(),
                        );
                      },
                      transitionDuration: Duration(seconds: 1),
                      reverseTransitionDuration: Duration(seconds: 1),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
