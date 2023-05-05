import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Function? onTap;
  final bool animated;
  final int? maxLines;

  const BaseText({
    Key? key,
    required this.title,
    this.style,
    this.textAlign,
    this.onTap,
    this.animated = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = animated
        ? AnimatedTextKit(
            key: UniqueKey(),
            repeatForever: false,
            totalRepeatCount: 1,
            animatedTexts: [
              RotateAnimatedText(
                title,
                textStyle: style,
                textAlign: textAlign ?? TextAlign.start,
                duration: const Duration(milliseconds: 300),
                rotateOut: false,
              )
            ],
          )
        : Text(
            title,
            style: style,
            textAlign: textAlign ?? TextAlign.start,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          );

    if (onTap == null) return text;

    return InkWell(
      onTap: () => onTap!(),
      child: text,
    );
  }
}
