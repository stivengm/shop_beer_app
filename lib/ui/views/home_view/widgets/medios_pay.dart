import 'package:flutter/material.dart';
import 'package:shop_beer_app/data/models/methods_pay_model.dart';
import 'package:shop_beer_app/ui/app_style.dart';

class MediosPay extends StatelessWidget {
  final List<MethodsPayModel>? methodsPay;

  const MediosPay({super.key, required this.methodsPay});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      width: double.infinity,
      child: Column(
        children: [
          Text("Nuestros métodos de pago"),
          Container(
            padding: const EdgeInsets.all(3),
            width: double.infinity,
            height: 85.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: methodsPay!.length,
              itemBuilder: ( BuildContext context, int index ) => Container(
                margin: const EdgeInsets.only(right: 5.0),
                width: 100.0,
                child: Image.network(methodsPay![index].img!, fit: BoxFit.contain,),
              )
            ),
          )
        ],
      ),
    );
  }
}
