import 'package:flutter/material.dart';
import 'package:food_app/auth/auth.dart';
import 'package:food_app/components/button.dart';
import 'package:food_app/components/textfield.dart';
// import 'package:food_app/view/home.dart';
import 'package:food_app/view/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final auth = Auth();
  final mailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
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
            MyButton(
              ontap: () {
                auth.login(
                  context,
                  email: mailcontroller.text,
                  password: passwordcontroller.text,
                );
              },
              text: 'Sign In',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member?  '),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SignUpPage(),
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
                    'Register now',
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
