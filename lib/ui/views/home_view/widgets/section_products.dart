import 'package:flutter/material.dart';
import 'package:shop_beer_app/data/models/products_model.dart';
import 'package:shop_beer_app/ui/app_style.dart';
import 'package:shop_beer_app/ui/views/detail_product_view/detail_product_view.dart';
import 'package:shop_beer_app/ui/widgets/pipe_widget.dart';

class SectionProducts extends StatelessWidget {
  final String nameCategory;
  final List<ProductsModel> products;
  const SectionProducts({super.key, required this.products, required this.nameCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(nameCategory, style: Theme.of(context).textTheme.titleMedium!,)
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            height: 170.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProductView(product: products[i],)));
                },
                child: Container(
                  width: 130.0,
                  margin: const EdgeInsets.symmetric(horizontal: 7.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Column(
                    children: [
                      Hero(
                        tag: products[i].id,
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/resources/loading-image.gif'),
                          image: NetworkImage(products[i].img),
                          fit: BoxFit.contain,
                          height: 100.0,
                        ),
                      ),
                      Expanded(
                        child: Text(products[i].name, textAlign: TextAlign.center,),
                      ),
                      Text(PipeWidget().formato(int.parse(products[i].price)))
                    ],
                  ),
                ),
              )
            ),
          )
        ],
      )
    );
  }
}