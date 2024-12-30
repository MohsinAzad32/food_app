import 'package:flutter/material.dart';
import 'package:food_app/view/cartpage.dart';

class SliverAppBarWidget extends StatelessWidget {
  final Widget title;
  final Widget child;
  const SliverAppBarWidget({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cartpage(),
              ),
            );
          },
          icon: Icon(
            Icons.shopping_cart_rounded,
          ),
        ),
      ],
      title: Text('Sunset Diner'),
      titleSpacing: 1,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(
            bottom: 65,
          ),
          child: child,
        ),
        title: title,
        expandedTitleScale: 1,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0, right: 0),
      ),
    );
  }
}
