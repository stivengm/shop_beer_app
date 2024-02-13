part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class IsLoader extends HomeEvent {
  final bool? isLoadingMethosPay;
  final bool? isLoadingDiscount;
  final bool? isLoadingStores;
  const IsLoader({this.isLoadingMethosPay, this.isLoadingDiscount, this.isLoadingStores});
}

class MethodsPay extends HomeEvent {
  final List<MethodsPayModel> methodsPay;
  const MethodsPay(this.methodsPay);
}

class Discount extends HomeEvent {
  final List<DiscountModel> discount;
  const Discount(this.discount);
}

class Stores extends HomeEvent {
  final List<StoresModel> stores;
  const Stores(this.stores);
}