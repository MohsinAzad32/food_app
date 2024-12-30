import 'package:flutter/material.dart';
import 'package:food_app/components/description_box.dart';
import 'package:food_app/components/drawer.dart';
import 'package:food_app/components/foodtile.dart';
import 'package:food_app/components/my_location.dart';
import 'package:food_app/components/sliver_appbar.dart';
import 'package:food_app/components/tabbar.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/providers/restaurant.dart';
import 'package:food_app/view/food_detail.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<Food> _filterMenuforCategory(
      FoodCategory category, List<Food> fullmenu) {
    return fullmenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuforCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return Foodtile(
              food: food,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetailsPage(
                        food: food,
                      ),
                    ));
              });
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body:
          NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBarWidget(
            title: TabBarWidget(
              controller: controller,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.primary,
                ),
                MyLocation(),
                DescriptionBox(),
              ],
            ),
          ),
        ];
      }, body: Consumer<RestaurantProvider>(
        builder: (context, value, child) {
          return TabBarView(
            controller: controller,
            children: getFoodInThisCategory(value.menu),
          );
        },
      )),
    );
  }
}
