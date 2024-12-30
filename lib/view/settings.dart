import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/theme/themeprovider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.only(
          left: 25,
          top: 10,
          right: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Darl Mode',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            CupertinoSwitch(
              value:
                  Provider.of<Themeprovider>(context, listen: false).isDarkMode,
              onChanged: (value) {
                Provider.of<Themeprovider>(context, listen: false)
                    .toggletheme();
              },
            )
          ],
        ),
      ),
    );
  }
}
