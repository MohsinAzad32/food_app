import 'package:flutter/material.dart';
import 'package:food_app/models/food.dart';
// import 'package:provider/provider.dart';

class Quantityselector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const Quantityselector({
    super.key,
    required this.food,
    required this.onDecrement,
    required this.onIncrement,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          50,
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: Icon(
              Icons.remove,
              size: 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 20,
              child: Center(
                child: Text(
                  quantity.toString(),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onIncrement,
            child: Icon(
              Icons.add,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
