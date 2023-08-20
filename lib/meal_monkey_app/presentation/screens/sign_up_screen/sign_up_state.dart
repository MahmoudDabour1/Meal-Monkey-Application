part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {
}

class SignUpErrorState extends SignUpStates {
}

class CreateUserSuccessState extends SignUpStates {}

class CreateUserErrorState extends SignUpStates {
  final String error;

  CreateUserErrorState(this.error);
}
