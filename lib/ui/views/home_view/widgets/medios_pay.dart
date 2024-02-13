import 'package:flutter/material.dart';

class MediosPay extends StatelessWidget {
  const MediosPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: Column(
        children: [
          Text("Nuestros medios de pago")
        ],
      ),
    );
  }
}