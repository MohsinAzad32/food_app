import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '\$ 0.99 ',
                // style: primarystyle,
              ),
              Text(
                'Delivery Charges',
                // style: secondarystyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '15 to 30 mins',
                // style: primarystyle,
              ),
              Text(
                'Delivery time',
                // style: secondarystyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
