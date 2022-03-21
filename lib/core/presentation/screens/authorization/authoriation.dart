import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torys/core/presentation/screens/authorization/bloc/bloc.dart';
import 'package:torys/core/presentation/screens/authorization/bloc/event.dart';
import 'package:torys/core/presentation/screens/authorization/bloc/state.dart';
import 'package:torys/core/presentation/screens/authorization/widgets/authorization_form.dart';
import 'package:torys/core/presentation/screens/authorization/widgets/logo.dart';
import 'package:torys/resources/theme.dart';

import '../../../../resources/theme.dart';

void unfocusInput(AuthorizationBloc authorizationBloc) {
  FocusManager.instance.primaryFocus?.unfocus();
  authorizationBloc.add(AuthorizationEvent.requestFocusOnInput(InputType.none));
}

class AuthorizationInherited extends InheritedWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();

  AuthorizationInherited({required Widget child}) : super(child: child);

  static AuthorizationInherited of(BuildContext context) {
    final AuthorizationInherited? result =
        context.dependOnInheritedWidgetOfExactType<AuthorizationInherited>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class AuthorizationScreen extends StatelessWidget {
  static const id = '/splash';
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // void unfocusInput() {
    //   FocusManager.instance.primaryFocus?.unfocus();
    //   context
    //       .read<AuthorizationBloc>()
    //       .add(AuthorizationEvent.requestFocusOnInput(InputType.none));
    // }

    return AuthorizationInherited(
      child: GestureDetector(
        onTap: () => unfocusInput(
          context.read<AuthorizationBloc>(),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: TorysTheme.white,
          body: BlocBuilder<AuthorizationBloc, AuthorizationState>(
            builder: (context, state) {
              if (state.authorizationStatus == AuthorizationStatus.loaded) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 30,
                        ),
                        child: TorysLogo(),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TorysAuthorizationForm(),
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: TorysTheme.mainColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
