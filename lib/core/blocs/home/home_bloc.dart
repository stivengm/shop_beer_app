import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_beer_app/data/models/discount_model.dart';
import 'package:shop_beer_app/data/models/methods_pay_model.dart';
import 'package:shop_beer_app/data/models/notifications_model.dart';
import 'package:shop_beer_app/data/models/products_model.dart';
import 'package:shop_beer_app/data/models/stores_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<IsLoader>((event, emit) {
      emit(state.copyWith(
        isLoadingBeer: event.isLoadingBeer,
        isLoadingMethosPay: event.isLoadingMethosPay,
        isLoadingDiscount: event.isLoadingDiscount,
        isLoadingStores: event.isLoadingStores,
        isLoadingProducts: event.isLoadingProducts,
        isLoadingNotifications: event.isLoadingNotifications
      ));
    });

    on<MethodsPay>((event, emit) {
      emit(state.copyWith( methodsPay: event.methodsPay ));
    });

    on<Products>((event, emit) {
      emit(state.copyWith( products: event.products ));
    });

    on<ProductsBeer>((event, emit) {
      emit(state.copyWith( productBeer: event.productBeer ));
    });
    
    on<ProductsAguardiente>((event, emit) {
      emit(state.copyWith( productAguardiente: event.productAguardiente ));
    });

    on<ProductRon>((event, emit) {
      emit(state.copyWith( productRon: event.productRon ));
    });
    
    on<Discount>((event, emit) {
      emit(state.copyWith( discount: event.discount ));
    });

    on<Stores>((event, emit) {
      emit(state.copyWith( stores: event.stores ));
    });

    on<Notifications>((event, emit) {
      emit(state.copyWith( notifications: event.notifications ));
    });

  }

  Future getProducts() async {
    add( const IsLoader(isLoadingProducts: true, isLoadingBeer: true) );
    var url = Uri.https('shop-beer-default-rtdb.firebaseio.com', 'products.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonProductsModel = jsonDecode(response.body);

      List<ProductsModel> productBeer = [];
      List<ProductsModel> productAguardiente = [];
      List<ProductsModel> productRon = [];

      final List<ProductsModel> productsModel = jsonProductsModel.map<ProductsModel>((m) => ProductsModel.fromJson(Map<String, dynamic>.from(m))).toList();

      for (var i = 0; i < productsModel.length; i++) {
        switch (productsModel[i].typeProductId) {
          case 1:
            productBeer.add(productsModel[i]);
            break;
          case 2:
            productAguardiente.add(productsModel[i]);
            break;
          case 3:
            productRon.add(productsModel[i]);
            break;
          default:
        }
      }
      
      add( ProductsBeer(productBeer) );
      add( ProductsAguardiente(productAguardiente) );
      add( ProductRon(productRon) );

      add( const IsLoader(isLoadingProducts: false) );
      add( Products(productsModel) );
    }
    getMethodsPay();
    timerLoaderBeer();
  }

  Future getMethodsPay() async {
    add( const IsLoader(isLoadingMethosPay: true) );
    var url = Uri.https('shop-beer-default-rtdb.firebaseio.com', 'medios_pago.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonMethodsPayModel = jsonDecode(response.body);
      final List<MethodsPayModel> methodsModel = jsonMethodsPayModel.map<MethodsPayModel>((m) => MethodsPayModel.fromJson(Map<String, dynamic>.from(m))).toList();
      add( const IsLoader(isLoadingMethosPay: false) );
      add( MethodsPay(methodsModel) );
    }
    getDiscounts();
  }

  Future getDiscounts() async {
    add( const IsLoader(isLoadingDiscount: true) );
    var url = Uri.https('shop-beer-default-rtdb.firebaseio.com', 'descuetos.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonDiscountModel = jsonDecode(response.body);
      final List<DiscountModel> discountModel = jsonDiscountModel.map<DiscountModel>((m) => DiscountModel.fromJson(Map<String, dynamic>.from(m))).toList();
      add( Discount(discountModel) );
      add( const IsLoader(isLoadingDiscount: false) );
    }
    getListShop();
  }

  Future getListShop() async {
    add( const IsLoader(isLoadingStores: true) );
    var url = Uri.https('shop-beer-default-rtdb.firebaseio.com', 'lugarVenta.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonShopModel = jsonDecode(response.body);
      final List<StoresModel> storesModel = jsonShopModel.map<StoresModel>((m) => StoresModel.fromJson(Map<String, dynamic>.from(m))).toList();
      add( Stores(storesModel) );
      add( const IsLoader(isLoadingStores: false) );
    }
    getNotifications();
  }

  Future getNotifications() async {
    add( const IsLoader(isLoadingNotifications: true) );
    var url = Uri.https('shop-beer-default-rtdb.firebaseio.com', 'notifications.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonNotificationsModel = jsonDecode(response.body);
      final List<NotificationsModel> notificationsModel = jsonNotificationsModel.map<NotificationsModel>((m) => NotificationsModel.fromJson(Map<String, dynamic>.from(m))).toList();
      add( Notifications(notificationsModel) );
      add( const IsLoader(isLoadingNotifications: false) );
    }
  }

  timerLoaderBeer() {
    Future.delayed(const Duration(seconds: 10), () {
      add( const IsLoader( isLoadingBeer: false ) );
    });
  }
}
