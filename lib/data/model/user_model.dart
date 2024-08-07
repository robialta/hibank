// Package imports:
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import 'package:hibank/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(UserCredential user)
      : super(user.user!.displayName!, user.user!.email!, user.user!.photoURL!);
  factory UserModel.createUser(UserCredential user) => UserModel(user);
}
