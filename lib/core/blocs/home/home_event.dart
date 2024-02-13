part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class IsLoader extends HomeEvent {
  final bool? isLoadingMethosPay;
  final bool? isLoadingDiscount;
  const IsLoader({this.isLoadingMethosPay, this.isLoadingDiscount});
}

class MethodsPay extends HomeEvent {
  final List<MethodsPayModel> methodsPay;
  const MethodsPay(this.methodsPay);
}

class Discount extends HomeEvent {
  final List<DiscountModel> discount;
  const Discount(this.discount);
}