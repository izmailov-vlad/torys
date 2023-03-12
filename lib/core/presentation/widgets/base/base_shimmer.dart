import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BaseShimmer extends StatelessWidget {
  final Widget widget;
  final Color baseColor;
  final Color highlightColor;
  final bool enabled;

  const BaseShimmer({
    Key? key,
    required this.widget,
    required this.baseColor,
    required this.highlightColor, required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: enabled,
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: widget,
    );
  }
}
