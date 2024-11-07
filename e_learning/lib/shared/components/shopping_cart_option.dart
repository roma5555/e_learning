import 'package:e_learning/shared/components/constants.dart';
import 'package:e_learning/util/util.dart';
import 'package:flutter/material.dart';

class ShoppingCartOption extends StatelessWidget {
  const ShoppingCartOption({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor,
      onPressed: (){
        Util.openShoppingCart(context);

      },
      child: const Icon(Icons.shopping_cart),
    );
  }
}
