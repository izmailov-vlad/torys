import 'package:flutter/material.dart';


class CustomBehavior extends ScrollBehavior {
  const CustomBehavior();

  @override
  Widget buildOverscrollIndicator(
      BuildContext context,
      Widget child,
      ScrollableDetails details,
      ) {
    return child;

    // return GlowingOverscrollIndicator(
    //   axisDirection: details.direction,
    //   color: context.theme.baseColor,
    //   child: child,
    // );
  }
}

class CustomStretchingBehavior extends ScrollBehavior {
  const CustomStretchingBehavior();

  @override
  Widget buildOverscrollIndicator(
      BuildContext context,
      Widget child,
      ScrollableDetails details,
      ) {
    return StretchingOverscrollIndicator(
      axisDirection: details.direction,
      child: child,
    );
  }

  @override
  TargetPlatform getPlatform(BuildContext context) => TargetPlatform.android;
}

class CustomNeverScrollableBehavior extends ScrollBehavior {
  const CustomNeverScrollableBehavior();

  @override
  Widget buildOverscrollIndicator(
      BuildContext context,
      Widget child,
      ScrollableDetails details,
      ) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const NeverScrollableScrollPhysics();
}

class CustomBehaviorWithoutOverscroll extends ScrollBehavior {
  const CustomBehaviorWithoutOverscroll();

  @override
  Widget buildOverscrollIndicator(
      BuildContext context,
      Widget child,
      ScrollableDetails details,
      ) {
    return child;
  }
}
