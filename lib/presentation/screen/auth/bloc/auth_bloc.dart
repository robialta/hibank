// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:hibank/domain/entity/user_entity.dart';
import 'package:hibank/domain/usecase/auth_usecase.dart';
import 'package:hibank/presentation/screen/auth/bloc/auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final AuthUseCase authUseCase;
  AuthBloc(this.authUseCase) : super(AuthInitState());

  Future<void> loginWIthGoogle() async {
    try {
      emit(AuthLoadingState());
      final UserEntity user = await authUseCase.signInWIthGoogle();
      emit(AuthSuccessState(user));
    } catch (e) {
      emit(
        AuthFailedState(e.toString()),
      );
    }
  }
}
