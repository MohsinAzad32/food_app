import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:food_app/models/cart.dart';
import 'package:food_app/models/food.dart';
import 'package:intl/intl.dart';

class RestaurantProvider extends ChangeNotifier {
  List<Food> get menu => _menu;
  final List<Food> _menu = [
//Burgers Items
    Food(
      description:
          'A Juicy beef patty with melted chedder, lectuce, tomato and hint of onion and pickle',
      imagepath: 'lib/images/burgers/one.jpg',
      price: 0.99,
      title: 'Classic Cheeseburger',
      availableAddons: [
        Addon(
          name: 'Extra cheese',
          price: 0.99,
        ),
        Addon(
          name: 'Bacon',
          price: 1.99,
        ),
        Addon(
          name: 'Avocado',
          price: 2.99,
        ),
      ],
      category: FoodCategory.burgers,
    ),
    Food(
      description:
          'A delicious veggie burger with a grilled veggie patty, lettuce, tomato, and aioli.',
      imagepath: 'lib/images/burgers/two.jpg',
      price: 1.29,
      title: 'Veggie Burger',
      availableAddons: [
        Addon(
          name: 'Guacamole',
          price: 1.49,
        ),
        Addon(
          name: 'Vegan cheese',
          price: 1.09,
        ),
      ],
      category: FoodCategory.burgers,
    ),
    Food(
      description:
          'A spicy burger with jalapeños, pepper jack cheese, and spicy sauce.',
      imagepath: 'lib/images/burgers/three.jpg',
      price: 1.49,
      title: 'Spicy Jalapeño Burger',
      availableAddons: [
        Addon(
          name: 'Extra sauce',
          price: 0.79,
        ),
        Addon(
          name: 'Double patty',
          price: 2.49,
        ),
      ],
      category: FoodCategory.burgers,
    ),
    Food(
      description:
          'A hearty beef patty topped with cheddar, crispy bacon, and barbecue sauce.',
      imagepath: 'lib/images/burgers/four.jpg',
      price: 1.79,
      title: 'BBQ Bacon Burger',
      availableAddons: [
        Addon(
          name: 'Extra bacon',
          price: 1.49,
        ),
        Addon(
          name: 'Onion rings',
          price: 1.29,
        ),
      ],
      category: FoodCategory.burgers,
    ),
    Food(
      description:
          'A classic cheeseburger with grilled mushrooms and Swiss cheese.',
      imagepath: 'lib/images/burgers/five.jpg',
      price: 1.59,
      title: 'Mushroom Swiss Burger',
      availableAddons: [
        Addon(
          name: 'Extra mushrooms',
          price: 1.19,
        ),
        Addon(
          name: 'Garlic aioli',
          price: 0.89,
        ),
      ],
      category: FoodCategory.burgers,
    ),
// Salads Items
    Food(
      description:
          'Crisp romaine lettuce, croutons, and parmesan cheese with Caesar dressing.',
      imagepath: 'lib/images/salads/one.jpg',
      price: 2.99,
      title: 'Caesar Salad',
      availableAddons: [
        Addon(
          name: 'Grilled chicken',
          price: 2.49,
        ),
        Addon(
          name: 'Extra dressing',
          price: 0.99,
        ),
      ],
      category: FoodCategory.salads,
    ),
    Food(
      description:
          'Mixed greens, cucumbers, tomatoes, and olives, topped with a balsamic vinaigrette.',
      imagepath: 'lib/images/salads/two.jpg',
      price: 3.49,
      title: 'Greek Salad',
      availableAddons: [
        Addon(
          name: 'Feta cheese',
          price: 1.29,
        ),
        Addon(
          name: 'Grilled lamb',
          price: 3.99,
        ),
      ],
      category: FoodCategory.salads,
    ),
    Food(
      description:
          'Fresh spinach, strawberries, walnuts, and goat cheese with raspberry vinaigrette.',
      imagepath: 'lib/images/salads/three.jpg',
      price: 3.99,
      title: 'Spinach Strawberry Salad',
      availableAddons: [
        Addon(
          name: 'Bacon bits',
          price: 1.19,
        ),
        Addon(
          name: 'Extra nuts',
          price: 0.99,
        ),
      ],
      category: FoodCategory.salads,
    ),
    Food(
      description:
          'Arugula, pears, blue cheese, and candied pecans with a honey mustard dressing.',
      imagepath: 'lib/images/salads/four.jpg',
      price: 4.29,
      title: 'Pear and Arugula Salad',
      availableAddons: [
        Addon(
          name: 'Grilled shrimp',
          price: 3.99,
        ),
        Addon(
          name: 'Avocado slices',
          price: 1.49,
        ),
      ],
      category: FoodCategory.salads,
    ),
    Food(
      description:
          'Crisp lettuce, avocado, bacon, and tomatoes with a ranch dressing.',
      imagepath: 'lib/images/salads/five.jpg',
      price: 3.79,
      title: 'Avocado Bacon Salad',
      availableAddons: [
        Addon(
          name: 'Grilled chicken',
          price: 2.49,
        ),
        Addon(
          name: 'Extra ranch',
          price: 0.79,
        ),
      ],
      category: FoodCategory.salads,
    ),
// Sides food items
    Food(
      description: 'Crispy golden fries served with ketchup.',
      imagepath: 'lib/images/sides/one.jpg',
      price: 1.49,
      title: 'French Fries',
      availableAddons: [
        Addon(
          name: 'Cheese sauce',
          price: 0.79,
        ),
        Addon(
          name: 'Garlic aioli',
          price: 0.99,
        ),
      ],
      category: FoodCategory.sides,
    ),
    Food(
      description: 'Crispy onion rings with a tangy dipping sauce.',
      imagepath: 'lib/images/sides/two.jpg',
      price: 1.99,
      title: 'Onion Rings',
      availableAddons: [
        Addon(
          name: 'Extra dipping sauce',
          price: 0.49,
        ),
        Addon(
          name: 'Spicy seasoning',
          price: 0.59,
        ),
      ],
      category: FoodCategory.sides,
    ),
    Food(
      description: 'Freshly baked breadsticks with a side of marinara sauce.',
      imagepath: 'lib/images/sides/three.jpg',
      price: 2.49,
      title: 'Breadsticks',
      availableAddons: [
        Addon(
          name: 'Cheese topping',
          price: 0.99,
        ),
        Addon(
          name: 'Garlic butter',
          price: 0.89,
        ),
      ],
      category: FoodCategory.sides,
    ),
    Food(
      description: 'Seasoned sweet potato fries with a hint of cinnamon.',
      imagepath: 'lib/images/sides/four.jpg',
      price: 2.19,
      title: 'Sweet Potato Fries',
      availableAddons: [
        Addon(
          name: 'Marshmallow dip',
          price: 1.09,
        ),
        Addon(
          name: 'Honey drizzle',
          price: 0.79,
        ),
      ],
      category: FoodCategory.sides,
    ),
    Food(
      description:
          'Crispy fried mozzarella sticks with marinara dipping sauce.',
      imagepath: 'lib/images/sides/five.jpg',
      price: 2.79,
      title: 'Mozzarella Sticks',
      availableAddons: [
        Addon(
          name: 'Extra marinara',
          price: 0.59,
        ),
        Addon(
          name: 'Ranch dip',
          price: 0.49,
        ),
      ],
      category: FoodCategory.sides,
    ),
//Desserts items
    Food(
      description: 'A rich chocolate cake topped with a layer of creamy fudge.',
      imagepath: 'lib/images/deserts/one.jpg',
      price: 3.99,
      title: 'Chocolate Fudge Cake',
      availableAddons: [
        Addon(
          name: 'Vanilla ice cream',
          price: 1.49,
        ),
        Addon(
          name: 'Extra fudge',
          price: 0.79,
        ),
      ],
      category: FoodCategory.desserts,
    ),
    Food(
      description:
          'Vanilla ice cream with chocolate chips and a warm chocolate sauce.',
      imagepath: 'lib/images/deserts/two.jpg',
      price: 2.99,
      title: 'Chocolate Chip Sundae',
      availableAddons: [
        Addon(
          name: 'Whipped cream',
          price: 0.49,
        ),
        Addon(
          name: 'Chopped nuts',
          price: 0.59,
        ),
      ],
      category: FoodCategory.desserts,
    ),
    Food(
      description:
          'Crispy fried dough with cinnamon sugar and a side of chocolate sauce.',
      imagepath: 'lib/images/deserts/three.jpg',
      price: 2.49,
      title: 'Cinnamon Churros',
      availableAddons: [
        Addon(
          name: 'Chocolate dip',
          price: 0.79,
        ),
        Addon(
          name: 'Caramel dip',
          price: 0.69,
        ),
      ],
      category: FoodCategory.desserts,
    ),
    Food(
      description:
          'Creamy cheesecake with a graham cracker crust and strawberry topping.',
      imagepath: 'lib/images/deserts/four.jpg',
      price: 3.49,
      title: 'Strawberry Cheesecake',
      availableAddons: [
        Addon(
          name: 'Whipped cream',
          price: 0.49,
        ),
        Addon(
          name: 'Chocolate drizzle',
          price: 0.59,
        ),
      ],
      category: FoodCategory.desserts,
    ),
    Food(
      description: 'A creamy, frozen dessert made from milk and fresh fruits.',
      imagepath: 'lib/images/deserts/five.jpg',
      price: 2.79,
      title: 'Frozen Yogurt',
      availableAddons: [
        Addon(
          name: 'Fresh berries',
          price: 1.29,
        ),
        Addon(
          name: 'Granola topping',
          price: 0.89,
        ),
      ],
      category: FoodCategory.desserts,
    ),
// Drinks items
    Food(
      description: 'A refreshing soda with a fizzy and sweet taste.',
      imagepath: 'lib/images/drinks/one.jpg',
      price: 1.29,
      title: 'Soda',
      availableAddons: [
        Addon(
          name: 'Extra ice',
          price: 0.49,
        ),
        Addon(
          name: 'Flavor shot',
          price: 0.69,
        ),
      ],
      category: FoodCategory.drinks,
    ),
    Food(
      description: 'Iced coffee with a hint of vanilla syrup and cream.',
      imagepath: 'lib/images/drinks/two.jpg',
      price: 2.99,
      title: 'Iced Vanilla Coffee',
      availableAddons: [
        Addon(
          name: 'Extra shot of espresso',
          price: 0.99,
        ),
        Addon(
          name: 'Almond milk',
          price: 0.79,
        ),
      ],
      category: FoodCategory.drinks,
    ),
    Food(
      description:
          'A cold, fruity smoothie made with fresh berries and yogurt.',
      imagepath: 'lib/images/drinks/three.jpg',
      price: 3.49,
      title: 'Berry Smoothie',
      availableAddons: [
        Addon(
          name: 'Protein boost',
          price: 1.19,
        ),
        Addon(
          name: 'Spinach',
          price: 0.99,
        ),
      ],
      category: FoodCategory.drinks,
    ),
    Food(
      description:
          'A refreshing lemonade with a perfect balance of sweetness and tartness.',
      imagepath: 'lib/images/drinks/four.jpg',
      price: 1.99,
      title: 'Lemonade',
      availableAddons: [
        Addon(
          name: 'Mint',
          price: 0.49,
        ),
        Addon(
          name: 'Raspberry',
          price: 0.79,
        ),
      ],
      category: FoodCategory.drinks,
    ),
    Food(
      description:
          'A hot cappuccino with a thick layer of foam and a sprinkle of cocoa.',
      imagepath: 'lib/images/drinks/five.jpg',
      price: 2.79,
      title: 'Cappuccino',
      availableAddons: [
        Addon(
          name: 'Cinnamon sprinkle',
          price: 0.29,
        ),
        Addon(
          name: 'Extra shot',
          price: 0.99,
        ),
      ],
      category: FoodCategory.drinks,
    ),
  ];

  // user cart
  final List<Cart> _cart = [];

  List<Cart> get cart => _cart;

  //add to cart
  void addtoCart(Food food, List<Addon> selectedAddon) {
    Cart? cartitem = _cart.firstWhereOrNull((item) {
      //check if food is same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddon =
          ListEquality().equals(item.selectedAddon, selectedAddon);

      return isSameAddon && isSameFood;
    });
    if (cartitem != null) {
      cartitem.quantity++;
    } else {
      _cart.add(
        Cart(
          food: food,
          selectedAddon: selectedAddon,
        ),
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removefromCart(Cart item) {
    int cartIndex = _cart.indexOf(item);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //calculate total price of food item
  double getTotalPrice() {
    double total = 0.0;

    for (Cart item in _cart) {
      double itemtotal = item.food.price;
      for (Addon addon in item.selectedAddon) {
        itemtotal += addon.price;
      }

      total += itemtotal + item.quantity;
    }
    return total;
  }
  // total item Count;

  int getTotalItemCount() {
    int totalItemCount = 0;
    for (Cart item in _cart) {
      totalItemCount += item.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  String _formatPrice(double price) {
    return '\$ ${price.toStringAsFixed(
      2,
    )}';
  }

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(
              addon.price,
            )})")
        .join(",");
  }

  String displayCartReciept() {
    final reciept = StringBuffer();

    reciept.writeln("Here's your reciept");
    reciept.writeln();

    String formattedTime = DateFormat('yyyy-MM--dd').format(DateTime.now());

    reciept.writeln(formattedTime);
    reciept.writeln();
    reciept.writeln('==================');

    for (final cartitem in _cart) {
      reciept.writeln(
          "${cartitem.quantity} X ${cartitem.food.title} - ${_formatPrice(
        cartitem.food.price,
      )}");

      if (cartitem.selectedAddon.isNotEmpty) {
        reciept.writeln("  Add-ons ${_formatAddons(
          cartitem.selectedAddon,
        )}");
      }

      reciept.writeln();
    }

    reciept.writeln("==============");
    reciept.writeln();
    reciept.writeln('Total Items: ${getTotalItemCount()}');
    reciept.writeln('Total Price: ${_formatPrice(
      getTotalPrice(),
    )}');
    reciept.writeln(
      'Delivering to: $_deliveryAddress',
    );

    return reciept.toString();
  }

  String _deliveryAddress = '99 Holywood Blv';

  String get deliveryAddress => _deliveryAddress;

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }
}
