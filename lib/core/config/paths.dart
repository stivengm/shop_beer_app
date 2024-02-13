import 'package:flutter/material.dart';
import 'package:shop_beer_app/ui/views/cart_view/cart_view.dart';
import 'package:shop_beer_app/ui/views/favorites_view/favorites_view.dart';
import 'package:shop_beer_app/ui/views/home_view/home_view.dart';
import 'package:shop_beer_app/ui/views/user/information_view/information_view.dart';
import 'package:shop_beer_app/ui/views/user/login_view/login_view.dart';
import 'package:shop_beer_app/ui/views/user/register_view/register_view.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {
  'home': ( _ ) => const HomeView(),
  'login': ( _ ) => const LoginView(),
  'register': ( _ ) => const RegisterView(),
  'information': ( _ ) => const InformationView(),
  'cart': ( _ ) => const CartView(),
  'favorites': ( _ ) => const FavoritesView()
};