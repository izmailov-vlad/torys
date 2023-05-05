import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class BaseRichText extends StatelessWidget {
  final String? text;
  final List<TextSpan>? children;
  final TextStyle? defaultTextStyle;

  const BaseRichText({
    Key? key,
    this.text,
    this.children,
    this.defaultTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: defaultTextStyle,
        children: children,
      ),
    );
  }
}
