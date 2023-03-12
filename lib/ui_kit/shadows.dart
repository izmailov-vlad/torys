import 'package:flutter/cupertino.dart';

import '../ui.dart';

abstract class AppShadows {
  static const mainShadow = [
    BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 8,
      color: AppColorsScheme.brownOpacity,
    )
  ];
}
