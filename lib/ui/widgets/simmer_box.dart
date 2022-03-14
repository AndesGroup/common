import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// {@template shimmer_box}
/// Trả về một [Widget] có kích thước là [width] và [height] được áp dụng sẵn hiệu ứng từ thư viện 
/// shimmer.
/// {@endtemplate}
class ShimmerBox extends StatelessWidget {
  /// {@macro shimmer_box}
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
