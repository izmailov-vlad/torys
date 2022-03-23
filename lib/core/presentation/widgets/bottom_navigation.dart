import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:torys/resources/svgs.dart';

class TorysBottomNavigation extends StatelessWidget {
  const TorysBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icHome,
          ),
          SvgPicture.asset(
            icSearch,
          ),
          SvgPicture.asset(
            icFavourite,
          ),
          SvgPicture.asset(
            icProfile,
          ),
        ],
      ),
    );
  }
}
