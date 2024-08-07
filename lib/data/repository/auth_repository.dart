// Package imports:
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import 'package:hibank/data/datasource/firebase/auth_datasource.dart';
import 'package:hibank/data/model/user_model.dart';
import 'package:hibank/domain/entity/user_entity.dart';

class AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepository(this.authDatasource);

  Future<UserEntity> loginWithGoogle() async {
    UserCredential user = await authDatasource.loginWithGoogle();
    return UserModel.createUser(user);
  }

  User? getCurrentUser() {
    return authDatasource.getCurrentUser();
  }

  Future<void> signOut() => authDatasource.logOut();
}
