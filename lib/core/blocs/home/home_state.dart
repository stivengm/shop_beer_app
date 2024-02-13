part of 'home_bloc.dart';

class HomeState extends Equatable {

  final bool isLoadingMethosPay;
  final List<MethodsPayModel>? methodsPay;

  const HomeState({
    this.isLoadingMethosPay = false,
    methodsPay
  }) : methodsPay = methodsPay ?? const [];

  HomeState copyWith({
    bool? isLoadingMethosPay,
    List<MethodsPayModel>? methodsPay
  }) => HomeState(
    isLoadingMethosPay: isLoadingMethosPay ?? this.isLoadingMethosPay,
    methodsPay: methodsPay ?? this.methodsPay
  );
  
  @override
  List<Object?> get props => [isLoadingMethosPay, methodsPay];
}

final class HomeInitial extends HomeState {}
