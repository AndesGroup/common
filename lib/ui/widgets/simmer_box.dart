import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    Key? key,
    this.width,
    this.height,
    this.child,
  }) : super(key: key);
  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xffdcdada),
      highlightColor: const Color(0x00dcdada),
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: child,
      ),
    );
  }
}
