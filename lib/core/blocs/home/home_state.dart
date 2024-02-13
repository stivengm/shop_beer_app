part of 'home_bloc.dart';

class HomeState extends Equatable {

  final bool isLoadingMethosPay;
  final bool isLoadingDiscount;
  final List<MethodsPayModel>? methodsPay;
  final List<DiscountModel>? discount;

  const HomeState({
    this.isLoadingMethosPay = false,
    this.isLoadingDiscount = false,
    methodsPay,
    discount
  }) : methodsPay = methodsPay ?? const [],
      discount = discount ?? const [];

  HomeState copyWith({
    bool? isLoadingMethosPay,
    bool? isLoadingDiscount,
    List<MethodsPayModel>? methodsPay,
    List<DiscountModel>? discount
  }) => HomeState(
    isLoadingMethosPay: isLoadingMethosPay ?? this.isLoadingMethosPay,
    isLoadingDiscount: isLoadingDiscount ?? this.isLoadingDiscount,
    methodsPay: methodsPay ?? this.methodsPay,
    discount: discount ?? this.discount
  );
  
  @override
  List<Object?> get props => [isLoadingMethosPay, methodsPay, discount];
}

final class HomeInitial extends HomeState {}
