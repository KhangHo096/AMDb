import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BaseShimmer extends StatelessWidget {
  final Duration? duration;
  final double width;
  final double height;
  const BaseShimmer({
    Key? key,
    required this.width,
    required this.height,
    this.duration
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
      baseColor: Colors.grey.shade500.withOpacity(0.75),
      highlightColor: Colors.grey.shade100.withOpacity(0.75),
      period: duration ?? Duration(milliseconds: 750),
    );
  }
}
