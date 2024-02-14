import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_beer_app/core/blocs/home/home_bloc.dart';
import 'package:shop_beer_app/core/blocs/notifications/notifications_bloc.dart';
import 'package:shop_beer_app/ui/app_style.dart';
import 'package:shop_beer_app/ui/drawers/home_drawer.dart';
import 'package:shop_beer_app/ui/views/home_view/widgets/discount.dart';
import 'package:shop_beer_app/ui/views/home_view/widgets/medios_pay.dart';
import 'package:shop_beer_app/ui/views/home_view/widgets/section_products.dart';
import 'package:shop_beer_app/ui/widgets/loader_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.getProducts();
    final notificationsBloc = BlocProvider.of<NotificationsBloc>(context);
    notificationsBloc.requestPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notificationsBloc = BlocProvider.of<NotificationsBloc>(context);
    
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.isLoadingBeer
            || state.isLoadingMethosPay 
            || state.isLoadingDiscount 
            || state.isLoadingStores
            || state.isLoadingProducts 
            || state.isLoadingNotifications ? 
        const LoaderWidget() : 
        Scaffold(
          key: scaffoldKey,
          backgroundColor: backgroundApp,
          appBar: AppBar(
            title: context.select(
              (NotificationsBloc notificationsBloc) => Text("${notificationsBloc.state.status}", style: const TextStyle(fontSize: 13.0),)
            ),
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                      size: 27,
                    ),
                    onPressed: () => Navigator.pushNamed(context, 'notifications'), 
                    // onPressed: () {
                    //   // notificationsBloc.getToken();
                    //   notificationsBloc.localNotifications();
                    // },
                  ),
                  Positioned(
                    top: 13,
                    left: 13,
                    child: Container(
                      width: 9.0,
                      height: 9.0,
                      decoration: BoxDecoration(
                        color: state.notifications!.isNotEmpty && state.notifications![0].show ? Colors.red : Colors.transparent,
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          drawer: HomeMenu(scaffoldKey: scaffoldKey),
          body: RefreshIndicator(
            onRefresh: () {
              return Future.delayed( const Duration( seconds: 3), 
              () {
                final homeBloc = BlocProvider.of<HomeBloc>(context);
                homeBloc.getProducts();
              });
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 25.0),
                  GestureDetector(
                    child: Text(notificationsBloc.state.token),
                    onLongPress: () {
                      Clipboard.setData(ClipboardData(text: notificationsBloc.state.token));

                    }
                  ),
                  state.discount!.isNotEmpty && state.discount![0].show ? DiscountWidget(discount: state.discount!,) : const SizedBox(),
                  state.methodsPay!.isNotEmpty ? MediosPay(methodsPay: state.methodsPay) : const SizedBox(),
                  state.productBeer!.isNotEmpty ? SectionProducts(nameCategory: "Cerveza", products: state.productBeer!) : const SizedBox(),
                  state.productAguardiente!.isNotEmpty ? SectionProducts(nameCategory: "Aguardiente", products: state.productAguardiente!) : const SizedBox(),
                  state.productRon!.isNotEmpty ? SectionProducts(nameCategory: "Ron", products: state.productRon!) : const SizedBox(),
                  const SizedBox(height: 25.0),
                ],
              ),
            ),
          )
        );
      },
    );
  }
}
