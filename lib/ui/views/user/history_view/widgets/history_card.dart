import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text("Fecha: 12 feb. 2024", style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontSize: 12.0 ),),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color.fromARGB(255, 179, 250, 182)
                ),
                child: Text("ENTREGADO", style: Theme.of(context).textTheme.headlineMedium!.copyWith( color: Colors.green, fontSize: 12.0, fontWeight: FontWeight.bold ),),
              ),
            ],
          ),
          Text("Se compró esto: ")
        ],
      ),
    );
  }
}