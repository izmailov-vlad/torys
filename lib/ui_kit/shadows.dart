import 'package:flutter/cupertino.dart';

import '../ui.dart';

abstract class AppShadows {
  static const mainShadow = [
    BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 4,
      color: AppColorsScheme.brownOpacity,
    )
  ];
}
