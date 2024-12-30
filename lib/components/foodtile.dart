import 'package:flutter/material.dart';
import 'package:food_app/models/food.dart';

class Foodtile extends StatelessWidget {
  final Food food;
  final Function() onTap;
  const Foodtile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //text Food Details
                      Text(
                        food.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '\$ ${food.price}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        food.description,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  // color: Colors.blue,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage(
                  //       food.imagepath,
                  //     ),
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  height: 140,
                  width: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    child: Image.asset(
                      food.imagepath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          indent: 25,
          endIndent: 25,
        ),
      ],
    );
  }
}
