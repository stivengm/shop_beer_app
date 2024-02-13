import 'package:flutter/material.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Información"),
          Text("Lugar de entrega:"),
          Text("Más información sobre la entrega"),
        ],
      ),
    );
  }
}