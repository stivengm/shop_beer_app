part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class IsLoading extends LoginEvent {
  final bool isLoading;
  const IsLoading(this.isLoading);
}