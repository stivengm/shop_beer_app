import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shop_beer_app/core/blocs/notifications/notifications_bloc.dart';
import 'package:shop_beer_app/core/config/paths.dart';
import 'package:shop_beer_app/core/providers/bloc_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationsBloc.initializeFirebaseCloudMessage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiBlocProvider(
      providers: providerBloc, 
      child: mateApp(textTheme)
    );
  }

  MaterialApp mateApp(TextTheme textTheme) => MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(textTheme),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    initialRoute: 'home',
    routes: routesApp(),
  );
}
