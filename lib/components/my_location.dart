import 'package:flutter/material.dart';
import 'package:food_app/providers/restaurant.dart';
import 'package:provider/provider.dart';

class MyLocation extends StatelessWidget {
  const MyLocation({super.key});

  void opensearchbox(BuildContext context) {
    final addresscontroller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Your Location'),
          content: TextField(
            controller: addresscontroller,
            decoration: InputDecoration(
              hintText: 'Search Address',
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                context.read<RestaurantProvider>().updateDeliveryAddress(
                      addresscontroller.text,
                    );
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver Now',
            style: TextStyle(
                // color: Theme.of(context).colorScheme.primary,
                ),
          ),
          GestureDetector(
            child: Row(
              children: [
                Consumer<RestaurantProvider>(
                  builder: (context, value, child) {
                    return Text(
                      value.deliveryAddress,
                      style: TextStyle(
                        // color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                InkWell(
                    onTap: () {
                      opensearchbox(context);
                    },
                    child: Icon(Icons.keyboard_arrow_down_rounded))
              ],
            ),
          )
        ],
      ),
    );
  }
}
