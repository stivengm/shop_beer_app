import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_beer_app/data/models/methods_pay_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<IsLoader>((event, emit) {
      emit(state.copyWith( isLoadingMethosPay: event.isLoadingMethosPay ));
    });

    on<MethodsPay>((event, emit) {
      emit(state.copyWith( methodsPay: event.methodsPay ));
    });

  }

  Future getMethodsPay() async {
    var url = Uri.https('shop-beer-default-rtdb.firebaseio.com', 'medios_pago.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonProductsModel = jsonDecode(response.body);
      final List<MethodsPayModel> methodsModel = jsonProductsModel.map<MethodsPayModel>((m) => MethodsPayModel.fromJson(Map<String, dynamic>.from(m))).toList();
      add( MethodsPay(methodsModel) );
    }
  }
}
