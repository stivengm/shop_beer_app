import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_beer_app/core/blocs/home/home_bloc.dart';
import 'package:shop_beer_app/ui/app_style.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: backgroundApp,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              Text(state.notifications![0].title),
              Text(state.notifications![0].description),
              Text(state.notifications![0].show.toString()),
            ],
          );
        },
      ),
    );
  }
}
