import 'package:flutter/material.dart';

class CartEmpyView extends StatelessWidget {
  const CartEmpyView({super.key});

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/resources/cart_empy.png', height: media.height * .5,),
          Text("No hay artículos en el carrito, añade artículos para poder verlas aquí.", style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontSize: 20.0), textAlign: TextAlign.center,),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}