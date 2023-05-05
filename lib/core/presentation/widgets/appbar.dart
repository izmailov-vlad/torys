import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../../utils/extentions/build_context_extension.dart';
import 'base/base_title.dart';
import 'base/leading_back.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final bool centerTitle;
  final Widget? title;
  final double elevation;
  final double leadingWidth;
  final EdgeInsets? titlePadding;
  final Color? appBarColor;
  final Widget? action;

  const BaseAppBar(
      {Key? key,
      this.appBarColor,
      required this.automaticallyImplyLeading,
      required this.centerTitle,
      this.title,
      this.elevation = 0,
      this.leadingWidth = AppConstants.kLeadingWidth,
      this.titlePadding,
      this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppBar(
          toolbarHeight: kToolbarHeight,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: title,
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          titleSpacing: 0,
          centerTitle: centerTitle,
          backgroundColor:
              appBarColor ?? context.theme.appBarTheme.backgroundColor,
          leadingWidth: leadingWidth,
          leading: automaticallyImplyLeading ? const BaseLeadingBack() : null,
          //TODO: Вынести доступ к кнопке в контроллер
          actions: [if (action != null) action!],
        ),
        // if (title != null)
        //   Container(
        //     width: double.infinity,
        //     color: appBarColor ?? context.theme.appBarTheme.backgroundColor,
        //     child: Center(
        //       child: Padding(
        //         padding: const EdgeInsets.only(bottom: 10),
        //         child: title!,
        //       ),
        //     ),
        //   ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(AppConstants.kToolbarHeight + 7);
}
