import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_beer_app/core/blocs/home/home_bloc.dart';
import 'package:shop_beer_app/ui/drawers/home_drawer.dart';
import 'package:shop_beer_app/ui/views/home_view/widgets/discount.dart';
import 'package:shop_beer_app/ui/views/home_view/widgets/medios_pay.dart';
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
    homeBloc.getMethodsPay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.isLoadingMethosPay 
            && state.isLoadingDiscount 
            && state.isLoadingStores ? 
        const LoaderWidget() : 
        Scaffold(
          key: scaffoldKey,
          appBar: AppBar(),
          drawer: HomeMenu(scaffoldKey: scaffoldKey),
          body: Column(
            children: [
              state.discount!.isNotEmpty ? DiscountWidget(discount: state.discount!,) : const SizedBox(),
              state.methodsPay!.isNotEmpty ? MediosPay(methodsPay: state.methodsPay) : const SizedBox()
            ],
          )
        );
      },
    );
  }
}
