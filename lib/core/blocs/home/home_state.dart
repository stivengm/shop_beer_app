part of 'home_bloc.dart';

class HomeState extends Equatable {

  final bool isLoadingMethosPay;
  final bool isLoadingDiscount;
  final bool isLoadingStores;
  final List<MethodsPayModel>? methodsPay;
  final List<DiscountModel>? discount;
  final List<StoresModel> stores;

  const HomeState({
    this.isLoadingMethosPay = false,
    this.isLoadingDiscount = false,
    this.isLoadingStores = false,
    methodsPay,
    discount,
    stores,
  }) : methodsPay = methodsPay ?? const [],
      discount = discount ?? const [],
      stores = stores ?? const [];

  HomeState copyWith({
    bool? isLoadingMethosPay,
    bool? isLoadingDiscount,
    bool? isLoadingStores,
    List<MethodsPayModel>? methodsPay,
    List<DiscountModel>? discount,
    List<StoresModel>? stores
  }) => HomeState(
    isLoadingMethosPay: isLoadingMethosPay ?? this.isLoadingMethosPay,
    isLoadingDiscount: isLoadingDiscount ?? this.isLoadingDiscount,
    isLoadingStores: isLoadingStores ?? this.isLoadingStores,
    methodsPay: methodsPay ?? this.methodsPay,
    discount: discount ?? this.discount,
    stores: stores ?? this.stores
  );
  
  @override
  List<Object?> get props => [isLoadingMethosPay, isLoadingDiscount, isLoadingStores, methodsPay, discount, stores];
}

final class HomeInitial extends HomeState {}
