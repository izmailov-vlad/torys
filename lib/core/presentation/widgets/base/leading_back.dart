import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../ui.dart';
import '../../../../ui_kit/images.dart';
import '../../router/bloc/event.dart';
import 'base_inkwell.dart';

class BaseLeadingBack extends StatelessWidget {
  const BaseLeadingBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseInkWell(
      padding: const EdgeInsets.all(8),
      borderRadius: const BorderRadius.all(Radius.circular(45)),
      onTap: () {
        context.read<RouterBloc>().add(RouterEvent.pop());
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Image.asset(
              AppImages.star,
              width: 7.9,
              height: 15,
              color: AppColorsScheme.black,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'back',
            style: AppTextTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
