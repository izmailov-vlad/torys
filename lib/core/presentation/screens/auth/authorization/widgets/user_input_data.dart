import '../../../../../../ui.dart';
import '../../../../../../utils/constants.dart';
import '../../../../widgets/base/base_button.dart';
import '../../../../widgets/base/base_input_text_field.dart';
import '../../../../widgets/base/base_title.dart';
import '../bloc/bloc.dart';

class UserInputData extends StatefulWidget {
  final ScreenState screenState;

  const UserInputData({
    Key? key,
    required this.screenState,
  }) : super(key: key);

  @override
  State<UserInputData> createState() => _UserInputDataState();
}

class _UserInputDataState extends State<UserInputData>
    with TickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _nameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _isNameValid = ValueNotifier(true);
  final ValueNotifier<bool> _isEmailValid = ValueNotifier(true);
  final ValueNotifier<bool> _isPasswordValid = ValueNotifier(true);

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(1.5, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    _isNameValid.dispose();
    _isEmailValid.dispose();
    _nameController.dispose();
    _isPasswordValid.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameFormKey.currentState?.dispose();
    _emailFormKey.currentState?.dispose();
    _passwordFormKey.currentState?.dispose();
    super.dispose();
  }

  bool _isUserDataValid() {
    final emailValid = _isEmailValid.value && _emailController.text.isNotEmpty;
    final passwordValid =
        _isPasswordValid.value && _passwordController.text.isNotEmpty;
    final nameValid = _isNameValid.value && _nameController.text.isNotEmpty;
    if (widget.screenState == ScreenState.authorization) {
      return emailValid && passwordValid;
    }
    return nameValid && emailValid && passwordValid && nameValid;
  }

  @override
  Widget build(BuildContext context) {
    widget.screenState == ScreenState.authorization
        ? _controller.reverse()
        : _controller.forward();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SlideTransition(
          position: _offsetAnimation,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: ValueListenableBuilder(
              valueListenable: _isNameValid,
              builder: (context, bool isValid, child) {
                return BaseInputTextField(
                  hintText: 'Введите имя',
                  validator: (value) {
                    if (value == null || value.isEmpty) return null;
                    if (!AppConstants.nameRegex.hasMatch(value)) {
                      return 'Name is incorrect, try again';
                    }
                    return null;
                  },
                  onEditingComplete: () {
                    _isNameValid.value =
                        _emailFormKey.currentState?.validate() ?? true;

                    context.unfocus();
                  },
                  controller: _nameController,
                  isValid: isValid,
                  formKey: _nameFormKey,
                );
              },
            ),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: _isEmailValid,
          builder: (context, bool isValid, child) {
            return BaseInputTextField(
              hintText: 'Электронная почта',
              validator: (value) {
                if (value == null || value.isEmpty) return null;
                if (!AppConstants.mailRegex.hasMatch(value)) {
                  return 'Email is incorrect, try again';
                }
                return null;
              },
              onEditingComplete: () {
                _isEmailValid.value =
                    _emailFormKey.currentState?.validate() ?? true;

                context.unfocus();
              },
              controller: _emailController,
              isValid: isValid,
              formKey: _emailFormKey,
            );
          },
        ),
        const SizedBox(height: 14),
        ValueListenableBuilder(
          valueListenable: _isPasswordValid,
          builder: (context, bool isValid, child) {
            return BaseInputTextField(
              hintText: 'Пароль',
              validator: (value) {
                if (value == null || value.isEmpty) return null;
                if (value.length < 8) {
                  return 'Password too short';
                }
                return null;
              },
              onEditingComplete: () {
                _isPasswordValid.value =
                    _passwordFormKey.currentState?.validate() ?? true;
                context.unfocus();
              },
              controller: _passwordController,
              isValid: isValid,
              formKey: _passwordFormKey,
            );
          },
        ),
        const SizedBox(height: 14),
        // SizedBox(
        //   height: 30,
        //   width: double.infinity,
        //   child: BaseText(
        //     title: widget.screenState == ScreenState.authorization ? 'Забыли пароль' : '',
        //     onTap: () {},
        //     textAlign: TextAlign.end,
        //     style: Theme.of(context).textTheme.bodyLarge,
        //   ),
        // ),
        const SizedBox(height: 24),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: BaseButton(
            onPressed: () {
              if (!_isUserDataValid()) return;
              widget.screenState == ScreenState.authorization
                  ? context.read<AuthorizationBloc>().add(
                        AuthorizationAuthEvent(
                          _emailController.text,
                          _passwordController.text,
                        ),
                      )
                  : context.read<AuthorizationBloc>().add(
                        AuthorizationRegisterEvent(
                          _nameController.text,
                          _emailController.text,
                          _passwordController.text,
                        ),
                      );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: BaseText(
                animated: true,
                title: widget.screenState == ScreenState.authorization
                    ? 'Вход'
                    : 'Зарегистироваться',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
