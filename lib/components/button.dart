import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function() ontap;
  final String text;
  const MyButton({
    super.key,
    required this.ontap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
