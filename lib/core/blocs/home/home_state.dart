part of 'home_bloc.dart';

class HomeState extends Equatable {

  final bool isLoadingBeer;
  final bool isLoadingMethosPay;
  final bool isLoadingProducts;
  final bool isLoadingDiscount;
  final bool isLoadingStores;
  final bool isLoadingNotifications;
  final List<MethodsPayModel>? methodsPay;
  final List<ProductsModel>? products;
  final List<DiscountModel>? discount;
  final List<StoresModel> stores;

  final List<ProductsModel>? productBeer;
  final List<ProductsModel>? productAguardiente;
  final List<ProductsModel>? productRon;

  final List<NotificationsModel>? notifications;

  const HomeState({
    this.isLoadingBeer = false,
    this.isLoadingMethosPay = false,
    this.isLoadingProducts = false,
    this.isLoadingDiscount = false,
    this.isLoadingStores = false,
    this.isLoadingNotifications = false,
    methodsPay,
    products,
    discount,
    stores,

    productBeer,
    productAguardiente,
    productRon,
    notifications
  }) : methodsPay = methodsPay ?? const [],
      products = products ?? const [],
      discount = discount ?? const [],
      stores = stores ?? const [],
      productBeer = productBeer ?? const [],
      productAguardiente = productAguardiente ?? const [],
      productRon = productRon ?? const [],
      notifications = notifications ?? const [];

  HomeState copyWith({
    bool? isLoadingBeer,
    bool? isLoadingMethosPay,
    bool? isLoadingProducts,
    bool? isLoadingDiscount,
    bool? isLoadingStores,
    bool? isLoadingNotifications,
    List<MethodsPayModel>? methodsPay,
    List<ProductsModel>? products,
    List<DiscountModel>? discount,
    List<StoresModel>? stores,

    List<ProductsModel>? productBeer,
    List<ProductsModel>? productAguardiente,
    List<ProductsModel>? productRon,
    List<NotificationsModel>? notifications,
  }) => HomeState(
    isLoadingBeer: isLoadingBeer ?? this.isLoadingBeer,
    isLoadingMethosPay: isLoadingMethosPay ?? this.isLoadingMethosPay,
    isLoadingProducts: isLoadingProducts ?? this.isLoadingProducts,
    isLoadingDiscount: isLoadingDiscount ?? this.isLoadingDiscount,
    isLoadingStores: isLoadingStores ?? this.isLoadingStores,
    isLoadingNotifications: isLoadingNotifications ?? this.isLoadingNotifications,
    methodsPay: methodsPay ?? this.methodsPay,
    products: products ?? this.products,
    discount: discount ?? this.discount,
    stores: stores ?? this.stores,

    productBeer: productBeer ?? this.productBeer,
    productAguardiente: productAguardiente ?? this.productAguardiente,
    productRon: productRon ?? this.productRon,
    notifications: notifications ?? this.notifications
  );
  
  @override
  List<Object?> get props => [isLoadingBeer, isLoadingMethosPay, isLoadingDiscount, isLoadingProducts, isLoadingStores, isLoadingNotifications, methodsPay, discount, stores, isLoadingProducts, products, productBeer, productAguardiente, productRon, notifications];
}

final class HomeInitial extends HomeState {}
