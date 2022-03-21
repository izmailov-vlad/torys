import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:torys/core/presentation/screens/authorization/bloc/state.dart';
import 'package:torys/extensions/text_style.dart';
import 'package:torys/resources/theme.dart';

class TorysInputForm extends StatelessWidget {
  final String icon;
  final String hintText;
  final bool isActive;
  final bool isValid;
  final InputType inputType;
  final Function onTap;
  final TextEditingController textEditingController;

  TorysInputForm(
      {Key? key,
      required this.textEditingController,
      this.isValid = true,
      required this.onTap,
      required this.inputType,
      required this.icon,
      required this.hintText,
      this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = TorysTheme.grey;
    if (isActive) color = TorysTheme.mainColor;
    if (!isValid) color = TorysTheme.red;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icon,
          color: color,
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: TextField(
            controller: textEditingController,
            autocorrect: inputType != InputType.password,
            obscureText: inputType == InputType.password,
            onTap: () => onTap(inputType),
            cursorColor: isValid ? TorysTheme.mainColor : TorysTheme.red,
            style: TextStyle(
              color: color,
            ),
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: color,
                ),
              ),
              contentPadding: EdgeInsets.only(
                left: 5,
                bottom: 15,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isValid ? TorysTheme.grey : TorysTheme.red,
                ),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isValid ? TorysTheme.grey : TorysTheme.red,
                ),
              ),
              hintStyle: UbuntuTextStyle.s16w400(
                isValid ? TorysTheme.grey : TorysTheme.red,
              ),
              hintText: hintText,
              constraints: BoxConstraints(
                maxHeight: 27,
              ),
            ),
          ),
        )
      ],
    );
  }
}
