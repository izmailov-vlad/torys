import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../ui.dart';
import '../../../ui_kit/radius.dart';
import '../../../ui_kit/shadows.dart';

class BookGenre extends StatelessWidget {
  final String name;

  const BookGenre({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
      decoration: const BoxDecoration(
        color: AppColorsScheme.mainColor,
        boxShadow: AppShadows.mainShadow,
        borderRadius: BorderRadius.all(
          Radius.circular(AppRadius.secondaryRadius),
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.withColor(AppColorsScheme.white),
        ),
      ),
    );
  }
}
