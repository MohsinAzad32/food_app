import 'package:flutter/material.dart';
import 'package:food_app/models/food.dart';

class TabBarWidget extends StatelessWidget {
  final TabController controller;
  const TabBarWidget({
    super.key,
    required this.controller,
  });

  List<Tab> _buildCategoryItem() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: _buildCategoryItem(),
      controller: controller,
    );
  }
}
