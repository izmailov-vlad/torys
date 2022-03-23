import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:torys/extensions/text_style.dart';
import 'package:torys/resources/pngs.dart';
import 'package:torys/resources/svgs.dart';

import 'package:torys/resources/theme.dart';

class TorysAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferedSize;

  const TorysAppBar({
    Key? key,
    required this.preferedSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: TorysTheme.white.withOpacity(0),
            height: preferedSize.height,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 20, left: 20),
              child: Row(
                children: [
                  Image.asset(userDefaultAvatar),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Здравствуйте, Владислав',
                          style: MontserratTextStyle.s16w500(TorysTheme.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Статус : Читает',
                          style:
                              MontserratTextStyle.s12w500(TorysTheme.mainColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: SvgPicture.asset(icNotification),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => preferedSize;
}
