import 'package:flutter/material.dart';
import 'package:food_app/components/quantityselector.dart';
import 'package:food_app/models/cart.dart';
import 'package:food_app/providers/restaurant.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final Cart cartitem;
  const CartTile({
    super.key,
    required this.cartitem,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, value, child) {
        return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.secondary),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 15,
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      child: Image.asset(
                        cartitem.food.imagepath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartitem.food.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '\$ ${cartitem.food.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Quantityselector(
                        food: cartitem.food,
                        onDecrement: () {
                          value.removefromCart(cartitem);
                        },
                        onIncrement: () {
                          value.addtoCart(
                              cartitem.food, cartitem.selectedAddon);
                        },
                        quantity: cartitem.quantity,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: cartitem.selectedAddon.isEmpty ? 0 : 60,
                child: ListView(
                  // padding: EdgeInsets.only(
                  //   left: 10,
                  //   bottom: 10,
                  //   right: 10,
                  // ),
                  scrollDirection: Axis.horizontal,
                  children: cartitem.selectedAddon
                      .map((addon) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FilterChip(
                              label: Row(
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(addon.name),
                                  Text(addon.price.toString()),
                                ],
                              ),
                              labelStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontSize: 12,
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              shape: StadiumBorder(
                                  side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              )),
                              onSelected: (value) {},
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
