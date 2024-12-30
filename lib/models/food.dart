class Food {
  final String title;
  final String description;
  final String imagepath;
  final double price;
  final FoodCategory category;
  List<Addon> availableAddons;

  Food({
    required this.description,
    required this.imagepath,
    required this.price,
    required this.title,
    required this.availableAddons,
    required this.category,
  });
}

enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
