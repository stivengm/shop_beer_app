import 'package:flutter/material.dart';
import 'package:shop_beer_app/ui/drawers/home_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      drawer: HomeMenu(scaffoldKey: scaffoldKey),
      body: const Center(
        child: Text("Body"),
      )
    );
  }
}