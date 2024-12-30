import 'package:flutter/material.dart';
import 'package:food_app/components/button.dart';
import 'package:food_app/components/cart_tile.dart';
import 'package:food_app/providers/restaurant.dart';
import 'package:food_app/view/payment_page.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, value, child) {
        final usercart = value.cart;

        return Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Are you sure you want to clear cart',
                        ),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                              value.clearCart();
                            },
                            child: Text('Yes'),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.delete,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    value.cart.isEmpty
                        ? Expanded(
                            child: Center(
                              child: Text(
                                'Cart is Empty',
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: usercart.length,
                              itemBuilder: (context, index) {
                                final item = usercart[index];
                                return CartTile(cartitem: item);
                              },
                            ),
                          ),
                  ],
                ),
              ),
              MyButton(
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(),
                    ),
                  );
                },
                text: 'Check Out >',
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        );
      },
    );
  }
}
