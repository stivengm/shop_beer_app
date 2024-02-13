part of 'home_bloc.dart';

class HomeState extends Equatable {

  final bool isLoadingMethosPay;
  final bool isLoadingProducts;
  final bool isLoadingDiscount;
  final bool isLoadingStores;
  final List<MethodsPayModel>? methodsPay;
  final List<ProductsModel>? products;
  final List<DiscountModel>? discount;
  final List<StoresModel> stores;

  const HomeState({
    this.isLoadingMethosPay = false,
    this.isLoadingProducts = false,
    this.isLoadingDiscount = false,
    this.isLoadingStores = false,
    methodsPay,
    products,
    discount,
    stores,
  }) : methodsPay = methodsPay ?? const [],
      products = products ?? const [],
      discount = discount ?? const [],
      stores = stores ?? const [];

  HomeState copyWith({
    bool? isLoadingMethosPay,
    bool? isLoadingProducts,
    bool? isLoadingDiscount,
    bool? isLoadingStores,
    List<MethodsPayModel>? methodsPay,
    List<ProductsModel>? products,
    List<DiscountModel>? discount,
    List<StoresModel>? stores
  }) => HomeState(
    isLoadingMethosPay: isLoadingMethosPay ?? this.isLoadingMethosPay,
    isLoadingProducts: isLoadingProducts ?? this.isLoadingProducts,
    isLoadingDiscount: isLoadingDiscount ?? this.isLoadingDiscount,
    isLoadingStores: isLoadingStores ?? this.isLoadingStores,
    methodsPay: methodsPay ?? this.methodsPay,
    products: products ?? this.products,
    discount: discount ?? this.discount,
    stores: stores ?? this.stores
  );
  
  @override
  List<Object?> get props => [isLoadingMethosPay, isLoadingDiscount, isLoadingProducts, isLoadingStores, methodsPay, discount, stores, isLoadingProducts];
}

final class HomeInitial extends HomeState {}
