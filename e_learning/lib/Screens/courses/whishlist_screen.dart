import 'package:e_learning/screens/courses/widget/whishlist.dart';
import 'package:e_learning/shared/components/bottom_option.dart';
import 'package:e_learning/shared/components/shopping_cart_option.dart';
import 'package:flutter/material.dart';

class WhishlistScreen extends StatelessWidget {
  const WhishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all( 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "Whishlist",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey.shade800),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Whishlist(),
            ],
          ),
        ),
      ),
      floatingActionButton: const  ShoppingCartOption(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const  BottomOption(selectedIndex: 3,),
    );
  }
}
