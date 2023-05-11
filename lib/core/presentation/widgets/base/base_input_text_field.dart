import '../../../../ui.dart';
import '../../presentation.dart';

class BaseInputTextField extends StatelessWidget {
  final String? initialValue;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final Function(String value)? onChanged;
  final Function(String? value)? onSaved;
  final TextEditingController? controller;
  final bool isValid;
  final GlobalKey<FormState>? formKey;
  final VoidCallback? onEditingComplete;
  final InputDecoration? inputDecoration;
  final Icon? prefixIcon;
  final bool withBorder;
  final bool? filled;
  final Color? fillColor;
  final Widget? suffixIcon;
  final String? headTitle;
  final String? initialText;

  const BaseInputTextField({
    Key? key,
    this.initialValue,
    this.hintText,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.controller,
    this.isValid = true,
    this.formKey,
    this.prefixIcon,
    this.onEditingComplete,
    this.inputDecoration,
    this.withBorder = true,
    this.filled,
    this.fillColor,
    this.suffixIcon,
    this.headTitle,
    this.initialText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget inputForm = Form(
      key: formKey,
      child: TextFormField(
        onSaved: onSaved,
        controller: controller,
        cursorColor: isValid ? AppColorsScheme.mainColor : AppColorsScheme.red,
        onEditingComplete: onEditingComplete,
        validator: validator,
        onChanged: (value) => onChanged != null
            ? onChanged!(value)
            : formKey?.currentState?.save(),
        style: isValid
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
    if (headTitle != null && headTitle!.isNotEmpty) {
      inputForm = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: BaseText(
              title: headTitle!,
              style: context.theme.textTheme.titleLarge,
            ),
          ),
          SizedBox(height: AppMargin.superSmallMargin.h),
          inputForm,
        ],
      );
    }
    return inputForm;
  }
}
