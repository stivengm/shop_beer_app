import 'package:flutter/material.dart';
import 'package:shop_beer_app/ui/app_style.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xFF201F1E),
      height: media.height * 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/loader.gif",
          ),
          const Center(
            child: CircularProgressIndicator(
              color: backgroundApp,
            ),
          ),
        ],
      ),
    );
  }
}