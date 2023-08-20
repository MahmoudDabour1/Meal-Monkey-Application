part of 'login_cubit.dart';


abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String msg;

  LoginErrorState({required this.msg});
}

