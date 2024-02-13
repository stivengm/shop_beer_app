import 'package:flutter/material.dart';
import 'package:shop_beer_app/data/models/menu_items.dart';

class HomeMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;


  const HomeMenu({super.key, required this.scaffoldKey});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        Navigator.pushNamed(context, menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        ...appMenuItems
        .sublist(0,3)
        .map((item) => NavigationDrawerDestination(
          icon: Icon( item.icon ), label: Text(item.title))
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        ...appMenuItems
        .sublist(3,6)
        .map((item) => NavigationDrawerDestination(
          icon: Icon( item.icon ), label: Text(item.title))
        )
      ]
    );
  }
}