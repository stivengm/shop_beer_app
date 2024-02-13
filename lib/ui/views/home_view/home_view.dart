import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_beer_app/core/blocs/home/home_bloc.dart';
import 'package:shop_beer_app/ui/app_style.dart';
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
    homeBloc.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.isLoadingBeer
            || state.isLoadingMethosPay 
            || state.isLoadingDiscount 
            || state.isLoadingStores
            || state.isLoadingProducts ? 
        const LoaderWidget() : 
        Scaffold(
          key: scaffoldKey,
          backgroundColor: backgroundApp,
          appBar: AppBar(),
          drawer: HomeMenu(scaffoldKey: scaffoldKey),
          body: SingleChildScrollView(
            child: Column(
              children: [
                state.discount!.isNotEmpty ? DiscountWidget(discount: state.discount!,) : const SizedBox(),
                state.methodsPay!.isNotEmpty ? MediosPay(methodsPay: state.methodsPay) : const SizedBox(),
                Container(
                  width: 100.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.red
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products!.length,
                    itemBuilder: ( BuildContext context, int index ) => Container(
                      child: Text(state.products![index].name)
                    )
                  )
                )
              ],
            ),
          )
        );
      },
    );
  }
}
