part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class IsLoader extends HomeEvent {
  final bool? isLoadingMethosPay;
  const IsLoader({this.isLoadingMethosPay});
}

class MethodsPay extends HomeEvent {
  final List<MethodsPayModel> methodsPay;
  const MethodsPay(this.methodsPay);
}