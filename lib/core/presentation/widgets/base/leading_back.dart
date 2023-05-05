import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../ui.dart';
import '../../../../ui_kit/images.dart';
import 'base_inkwell.dart';

class BaseLeadingBack extends StatelessWidget {
  const BaseLeadingBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseInkWell(
      borderRadius: const BorderRadius.all(Radius.circular(45)),
      onTap: () => context.router.pop(),
      child: const Icon(
        Icons.arrow_back,
        color: AppColorsScheme.black,
      ),
    );
  }
}
