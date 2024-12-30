import 'package:food_app/models/food.dart';

class Cart {
  Food food;
  List<Addon> selectedAddon;
  int quantity;

  Cart({
    required this.food,
    required this.selectedAddon,
    this.quantity = 1,
  });

  double get totalprice {
    double addonprice =
        selectedAddon.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonprice) * quantity;
  }
}
