import 'package:discover_kenya/res/assets.dart';
import 'package:flutter/material.dart';
import 'package:discover_kenya/components/card_item.dart';

class Wildlife extends StatelessWidget {
  // pictures' url list
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          childAspectRatio: 1.4,
          children: List.generate(wildlife.length, (index) {
            return Center(
              child: ItemCard(imageURL: wildlife[index],
              ),
            );
          })),
    );
  }
}
