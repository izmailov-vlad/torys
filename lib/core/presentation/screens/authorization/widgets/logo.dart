import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../resources/pngs.dart';
import '../../../../../resources/svgs.dart';
import '../../../../../resources/theme.dart';

class TorysLogo extends StatelessWidget {
  const TorysLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            mainPicture,
          ),
          SizedBox(
            height: 20,
          ),
          SvgPicture.asset(
            mainLabel,
            color: TorysTheme.mainColor,
          ),
        ],
      ),
    );
  }
}
