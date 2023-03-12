import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class AppConstants {
  static const double appBarLogoWidth = 196;
  static const double appBarLogoHeight = 28;

  static const double kToolbarHeight = 80;
  static const double kLeadingWidth = 80;

  static const double buttonHeight = 48;

  static const Duration onBoardingDuration = Duration(milliseconds: 4000);
  static const double splashLogoWidth = 199;

  static const double splashLogoHeight = 205;

  static const Duration splashDuration = Duration(milliseconds: 500);
  static const int timeRemaining = 20;
  static const String locale = 'ru';

  /// Strings
  ///
  static final RegExp nameRegex = RegExp(r'[0-9-a-zA-Zа-яА-Я]+$');
  static final RegExp mailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  ///PHONE
  ///

  static final String phoneCode = '+7';

  static final MaskTextInputFormatter mailMaskFormatter =
      MaskTextInputFormatter(filter: {});

  static final MaskTextInputFormatter phoneMaskFormatter =
      MaskTextInputFormatter(
    mask: ' (###) ###-##-##',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static final MaskTextInputFormatter outputPhoneMaskFormatter =
      MaskTextInputFormatter(
    mask: '+# ### ###-##-##',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static final MaskTextInputFormatter outputPhoneBracketsMaskFormatter =
      MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  static final MaskTextInputFormatter otpMaskFormatter = MaskTextInputFormatter(
    mask: '####',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}
