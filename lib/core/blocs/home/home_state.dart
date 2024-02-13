part of 'home_bloc.dart';

class HomeState extends Equatable {

  final bool isLoadingBeer;
  final bool isLoadingMethosPay;
  final bool isLoadingProducts;
  final bool isLoadingDiscount;
  final bool isLoadingStores;
  final List<MethodsPayModel>? methodsPay;
  final List<ProductsModel>? products;
  final List<DiscountModel>? discount;
  final List<StoresModel> stores;

  final List<ProductsModel>? productBeer;
  final List<ProductsModel>? productAguardiente;
  final List<ProductsModel>? productRon;

  const HomeState({
    this.isLoadingBeer = false,
    this.isLoadingMethosPay = false,
    this.isLoadingProducts = false,
    this.isLoadingDiscount = false,
    this.isLoadingStores = false,
    methodsPay,
    products,
    discount,
    stores,

    productBeer,
    productAguardiente,
    productRon
  }) : methodsPay = methodsPay ?? const [],
      products = products ?? const [],
      discount = discount ?? const [],
      stores = stores ?? const [],
      productBeer = productBeer ?? const [],
      productAguardiente = productAguardiente ?? const [],
      productRon = productRon ?? const [];

  HomeState copyWith({
    bool? isLoadingBeer,
    bool? isLoadingMethosPay,
    bool? isLoadingProducts,
    bool? isLoadingDiscount,
    bool? isLoadingStores,
    List<MethodsPayModel>? methodsPay,
    List<ProductsModel>? products,
    List<DiscountModel>? discount,
    List<StoresModel>? stores,

    List<ProductsModel>? productBeer,
    List<ProductsModel>? productAguardiente,
    List<ProductsModel>? productRon
  }) => HomeState(
    isLoadingBeer: isLoadingBeer ?? this.isLoadingBeer,
    isLoadingMethosPay: isLoadingMethosPay ?? this.isLoadingMethosPay,
    isLoadingProducts: isLoadingProducts ?? this.isLoadingProducts,
    isLoadingDiscount: isLoadingDiscount ?? this.isLoadingDiscount,
    isLoadingStores: isLoadingStores ?? this.isLoadingStores,
    methodsPay: methodsPay ?? this.methodsPay,
    products: products ?? this.products,
    discount: discount ?? this.discount,
    stores: stores ?? this.stores,

    productBeer: productBeer ?? this.productBeer,
    productAguardiente: productAguardiente ?? this.productAguardiente,
    productRon: productRon ?? this.productRon
  );
  
  @override
  List<Object?> get props => [isLoadingBeer, isLoadingMethosPay, isLoadingDiscount, isLoadingProducts, isLoadingStores, methodsPay, discount, stores, isLoadingProducts, products, productBeer, productAguardiente, productRon];
}

final class HomeInitial extends HomeState {}
