import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/firebase_options.dart';
import 'package:food_app/providers/cardprovider.dart';
import 'package:food_app/providers/restaurant.dart';
import 'package:food_app/theme/themeprovider.dart';
import 'package:food_app/view/login.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Themeprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RestaurantProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cardprovider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: Provider.of<Themeprovider>(context).themeData,
    );
  }
}
