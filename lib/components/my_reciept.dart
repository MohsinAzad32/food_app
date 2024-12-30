import 'package:flutter/material.dart';
import 'package:food_app/providers/restaurant.dart';
import 'package:provider/provider.dart';

class MyReciept extends StatelessWidget {
  const MyReciept({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 25,
        top: 50,
      ),
      child: Center(
        child: Column(
          spacing: 25,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thank You For your Order',
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(
                25,
              ),
              child: Consumer<RestaurantProvider>(
                builder: (context, value, child) {
                  return Text(value.displayCartReciept());
                },
              ),
            ),
            Text(
              'Estimated delivery time is: 4:10 PM',
            ),
          ],
        ),
      ),
    );
  }
}
