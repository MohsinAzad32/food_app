import 'package:flutter/material.dart';
import 'package:food_app/auth/auth.dart';
import 'package:food_app/components/optiontile.dart';
import 'package:food_app/view/settings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        spacing: 15,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Icon(
              Icons.lock_open_rounded,
              size: 100,
            ),
          ),
          Divider(),
          Optiontile(
            onTap: () {
              Navigator.pop(context);
            },
            icon: Icons.home_rounded,
            text: 'H O M E',
          ),
          Optiontile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ));
            },
            icon: Icons.settings,
            text: 'S E T T I N G S',
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: Optiontile(
              onTap: () {
                Auth().logout(context);
              },
              icon: Icons.logout_rounded,
              text: 'L O G O U T',
            ),
          ),
        ],
      ),
    );
  }
}
