import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_beer_app/core/blocs/home/home_bloc.dart';
import 'package:shop_beer_app/core/blocs/login/login_bloc.dart';
import 'package:shop_beer_app/core/blocs/notifications/notifications_bloc.dart';

final List<BlocProvider> providerBloc = [
  BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
  BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
  BlocProvider<NotificationsBloc>(create: (_) => NotificationsBloc()),
];