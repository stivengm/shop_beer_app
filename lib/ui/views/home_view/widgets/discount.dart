import 'package:flutter/material.dart';
import 'package:shop_beer_app/data/models/discount_model.dart';
import 'package:shop_beer_app/ui/app_style.dart';

class DiscountWidget extends StatelessWidget {
  final List<DiscountModel> discount;
  const DiscountWidget({super.key, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.only(left: 10.0, right: 5.0),
      decoration: BoxDecoration(
        color: discountColor,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${discount[0].descuento}%", style: Theme.of(context).textTheme.headlineMedium!.copyWith( color: whiteColor, fontSize: 40.0 ),),
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(discount[0].description, style: Theme.of(context).textTheme.headlineMedium!.copyWith( color: whiteColor, fontSize: 20.0),),
              ),
            ],
          ),
          Text(discount[0].vencimiento, style: Theme.of(context).textTheme.headlineMedium!.copyWith( color: whiteColor, fontSize: 10.0 ),),
        ],
      ),
    );
  }
}