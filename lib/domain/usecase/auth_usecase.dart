// Project imports:
import 'package:hibank/data/repository/auth_repository.dart';
import 'package:hibank/domain/entity/user_entity.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase(this.authRepository);

  Future<UserEntity> signInWIthGoogle() async {
    return authRepository.loginWithGoogle();
  }
}
