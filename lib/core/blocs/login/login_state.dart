part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoading;

  const LoginState({
    this.isLoading = false
  });

  LoginState copyWith({
    bool? isLoading
  }) => LoginState(
    isLoading: isLoading ?? this.isLoading
  );
  
  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}
