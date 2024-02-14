import 'package:flutter/material.dart';
import 'package:shop_beer_app/ui/views/cart_view/widgets/cart_empy.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CartEmpyView(),
    );
  }
}