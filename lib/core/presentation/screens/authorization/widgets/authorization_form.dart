import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:torys/core/presentation/screens/authorization/bloc/bloc.dart';
import 'package:torys/core/presentation/screens/authorization/bloc/event.dart';
import 'package:torys/core/presentation/screens/authorization/bloc/state.dart';
import 'package:torys/core/presentation/screens/authorization/widgets/input_form.dart';

import '../../../../../extensions/text_style.dart';
import '../../../../../resources/svgs.dart';
import '../../../../../resources/theme.dart';
import '../authoriation.dart';

class TorysAuthorizationForm extends StatelessWidget {
  TorysAuthorizationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void changeScreenType() {
      unfocusInput(context.read<AuthorizationBloc>());
      context
          .read<AuthorizationBloc>()
          .add(AuthorizationEvent.changeScreenType());
    }

    void onInputTap(InputType activateInput) {
      context
          .read<AuthorizationBloc>()
          .add(AuthorizationEvent.requestFocusOnInput(
            activateInput,
          ));
    }

    return BlocBuilder<AuthorizationBloc, AuthorizationState>(
      builder: ((context, state) {
        String emailText = 'Email';
        String acceptButtonText = 'Войти';
        String screentTypeButtonText = 'Зарегистрируйтесь';
        String screenTypeTitleText = 'У вас ещё нет аккаунта?';

        Widget child = Container();
        if (state.screenType == ScreenType.registration) {
          screenTypeTitleText = 'У вас уже есть аккаунт?';
          screentTypeButtonText = 'Войти';
          acceptButtonText = 'Зарегистрироваться';

          child = Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: TorysInputForm(
                  onTap: onInputTap,
                  isValid: state.inputDataStatus == InputDataStatus.valid,
                  inputType: InputType.name,
                  isActive: state.activeInput == InputType.name,
                  icon: icFace,
                  hintText: 'Ваше имя',
                  textEditingController:
                      AuthorizationInherited.of(context).name,
                ),
              ),
              SizedBox(
                height: 35,
              ),
            ],
          );
        }
        return Column(
          children: [
            AnimatedSwitcher(
              child: child,
              duration: Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SizeTransition(
                  axis: Axis.vertical,
                  axisAlignment: -1,
                  sizeFactor: animation,
                  child: child,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: TorysInputForm(
                isActive: state.activeInput == InputType.email,
                icon: icAtSign,
                isValid: state.inputDataStatus == InputDataStatus.valid,
                hintText: emailText,
                inputType: InputType.email,
                onTap: onInputTap,
                textEditingController: AuthorizationInherited.of(context).email,
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20.0,
                left: 20.0,
              ),
              child: TorysInputForm(
                icon: icLock,
                hintText: 'Пароль',
                isValid: state.inputDataStatus == InputDataStatus.valid,
                isActive: state.activeInput == InputType.password,
                inputType: InputType.password,
                onTap: onInputTap,
                textEditingController:
                    AuthorizationInherited.of(context).password,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 24.0, top: 6),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Забыли пароль?',
                      style: UbuntuTextStyle.s12w400(
                        TorysTheme.mainColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(195, 41),
                primary: TorysTheme.mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                context.read<AuthorizationBloc>().add(
                      AuthorizationEvent.onAcceptButtonPressed(
                        AuthorizationInherited.of(context).email.text,
                        AuthorizationInherited.of(context).password.text,
                      ),
                    );
              },
              child: Text(
                acceptButtonText,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(screenTypeTitleText),
                TextButton(
                  child: Text(
                    screentTypeButtonText,
                    style: UbuntuTextStyle.s14w400(TorysTheme.mainColor),
                  ),
                  onPressed: () => changeScreenType(),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
