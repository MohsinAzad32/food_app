import 'package:flutter/material.dart';

class Optiontile extends StatelessWidget {
  final String text;
  final Function() onTap;
  final IconData icon;
  const Optiontile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ListTile(
        onTap: onTap,
        title: Text(text),
        leading: Icon(
          icon,
        ),
      ),
    );
  }
}
