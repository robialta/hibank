// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:hibank/presentation/constant/image_constants.dart';
import 'package:hibank/presentation/screen/auth/auth_constants.dart';
import 'package:hibank/presentation/screen/auth/bloc/auth_bloc.dart';
import 'package:hibank/presentation/screen/auth/bloc/auth_state.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = KiwiContainer().resolve<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>.value(
        value: _authBloc,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  AuthConstants.wellcomeLabel,
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  AuthConstants.loginNoteLabel,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (_, state) {
                  Widget icon = Image.asset(
                    ImageConstants.google,
                    width: 32,
                  );
                  double padding = 8;
                  if (state is AuthLoadingState) {
                    icon = Image.asset(
                      ImageConstants.loading,
                      width: 32,
                    );
                    padding = 8.0;
                  }
                  return OutlinedButton.icon(
                    style: ButtonStyle(
                      padding:
                          MaterialStatePropertyAll(EdgeInsets.all(padding)),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      _authBloc.loginWIthGoogle();
                    },
                    icon: icon,
                    label: const Text(AuthConstants.loginButtonLabel),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
