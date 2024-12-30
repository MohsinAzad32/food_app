import 'package:flutter/material.dart';
import 'package:food_app/components/button.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/providers/restaurant.dart';
import 'package:provider/provider.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  FoodDetailsPage({
    super.key,
    required this.food,
  }) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    void addtoCart(Food food, Map<Addon, bool> selectedAddon) {
      Navigator.pop(context);
      List<Addon> currentSelectedAddon = [];
      for (Addon addon in widget.food.availableAddons) {
        if (widget.selectedAddons[addon] == true) {
          currentSelectedAddon.add(addon);
        }
      }
      context.read<RestaurantProvider>().addtoCart(food, currentSelectedAddon);
    }

    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  widget.food.imagepath,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$ ${widget.food.price}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.food.description,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Add-ons',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.secondary,
                            )),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.food.availableAddons.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final item = widget.food.availableAddons[index];
                            return CheckboxListTile(
                              title: Text(item.name),
                              subtitle: Text('\$ ${item.price}'),
                              value: widget.selectedAddons[item],
                              onChanged: (value) {
                                setState(() {
                                  widget.selectedAddons[item] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                MyButton(
                  ontap: () => addtoCart(widget.food, widget.selectedAddons),
                  text: 'Add to cart',
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Opacity(
              opacity: 0.6,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
