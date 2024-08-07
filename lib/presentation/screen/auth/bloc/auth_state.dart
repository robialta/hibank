// Project imports:
import 'package:hibank/domain/entity/user_entity.dart';

abstract class AuthState {
  UserEntity? userEntity;
  String? errorMEssage;

  AuthState({this.userEntity, this.errorMEssage});
}

class AuthInitState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {}

class AuthSuccessState extends AuthState {
  AuthSuccessState(UserEntity user) : super(userEntity: user);
}

class AuthFailedState extends AuthState {
  AuthFailedState(String? error) : super(errorMEssage: error);
}
