import 'package:flutter/material.dart';

class MenuItem {

  final String title;
  final IconData icon;
  final String link;

  const MenuItem({
    required this.title,
    required this.icon,
    required this.link,
  });

}

const appMenuItems = <MenuItem> [

  MenuItem(
    title: "Inicio",
    icon: Icons.home,
    link: "home"
  ),
  MenuItem(
    title: "Carrito de compras",
    icon: Icons.shopping_cart_outlined,
    link: "cart"
  ),
  MenuItem(
    title: "Favoritos",
    icon: Icons.heart_broken_outlined,
    link: "favorites"
  ),

];