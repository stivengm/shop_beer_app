import 'package:flutter/material.dart';

class HeaderInformation extends StatelessWidget {
  final String title;
  const HeaderInformation({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge!.copyWith( fontSize: 18.0 ),),
    );
  }
}