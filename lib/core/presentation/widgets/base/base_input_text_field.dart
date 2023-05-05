import '../../../../ui.dart';

class BaseInputTextField extends StatelessWidget {
  final String? initialValue;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final Function(String value)? onChanged;
  final Function(String? value)? onSaved;
  final TextEditingController? controller;
  final bool? isValid;
  final GlobalKey<FormState>? formKey;
  final VoidCallback? onEditingComplete;
  final InputDecoration? inputDecoration;
  final Icon? prefixIcon;
  final bool withBorder;
  final bool? filled;
  final Color? fillColor;
  final Widget? suffixIcon;

  const BaseInputTextField({
    Key? key,
    this.initialValue,
    this.hintText,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.controller,
    this.isValid,
    this.formKey,
    this.prefixIcon,
    this.onEditingComplete,
    this.inputDecoration,
    this.withBorder = true,
    this.filled,
    this.fillColor, this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        onSaved: onSaved,
        controller: controller,
        cursorColor: isValid != null && isValid!
            ? AppColorsScheme.mainColor
            : AppColorsScheme.red,
        onEditingComplete: onEditingComplete,
        validator: validator,
        onChanged: (value) =>
            onChanged!(value) ?? formKey?.currentState?.save(),
        style: isValid != null && isValid!
            ? context.theme.textTheme.headlineLarge
            : context.theme.textTheme.headlineLarge
                ?.copyWith(color: AppColorsScheme.red),
        initialValue: initialValue,
        decoration: inputDecoration ??
            InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              filled: filled,
              fillColor: fillColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    withBorder ? const BorderSide(width: 1) : BorderSide.none,
              ),
              hintText: hintText,
            ),
      ),
    );
  }
}
