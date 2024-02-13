import 'package:flutter/material.dart';
import 'package:shop_beer_app/data/models/products_model.dart';

class SectionProducts extends StatelessWidget {
  final String nameCategory;
  final List<ProductsModel> products;
  const SectionProducts({super.key, required this.products, required this.nameCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(nameCategory)
          ),
          Container(
            width: double.infinity,
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) => Container(
                child: Text(products[index].name),
              )
            ),
          )
        ],
      )
    );
  }
}