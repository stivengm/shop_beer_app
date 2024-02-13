import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_beer_app/data/models/discount_model.dart';
import 'package:shop_beer_app/data/models/methods_pay_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<IsLoader>((event, emit) {
      emit(state.copyWith(
        isLoadingMethosPay: event.isLoadingMethosPay,
        isLoadingDiscount: event.isLoadingDiscount 
      ));
    });

    on<MethodsPay>((event, emit) {
      emit(state.copyWith( methodsPay: event.methodsPay ));
    });
    
    on<Discount>((event, emit) {
      emit(state.copyWith( discount: event.discount ));
    });

  }

  Future getMethodsPay() async {
    add( const IsLoader(isLoadingMethosPay: true) );
    var url = Uri.https('shop-beer-default-rtdb.firebaseio.com', 'medios_pago.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonProductsModel = jsonDecode(response.body);
      final List<MethodsPayModel> methodsModel = jsonProductsModel.map<MethodsPayModel>((m) => MethodsPayModel.fromJson(Map<String, dynamic>.from(m))).toList();
      add( const IsLoader(isLoadingMethosPay: false) );
      add( MethodsPay(methodsModel) );
    }
  }

  Future getDiscounts() async {
    add( const IsLoader(isLoadingDiscount: true) );
    var url = Uri.https('shop-beer-default-rtdb.firebaseio.com', 'descuetos.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonDiscountModel = jsonDecode(response.body);
      print(jsonDiscountModel);
      final List<DiscountModel> discountModel = jsonDiscountModel.map<DiscountModel>((m) => DiscountModel.fromJson(Map<String, dynamic>.from(m))).toList();
      print(discountModel);
      add( Discount(discountModel) );
      add( const IsLoader(isLoadingDiscount: false) );
    }
  }
}
