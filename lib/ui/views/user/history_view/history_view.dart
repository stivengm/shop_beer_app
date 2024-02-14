import 'package:flutter/material.dart';
import 'package:shop_beer_app/ui/app_style.dart';
import 'package:shop_beer_app/ui/views/user/history_view/widgets/history_card.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundApp,
      appBar: AppBar(),
      body:const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              HistoryCard(),
              HistoryCard(),
              
            ],
          ),
        ),
      )
    );
  }
}