import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../config/const.dart';
import '../../utils/helpers.dart';


class ImageWidget extends StatelessWidget {
  // ignore: prefer_function_declarations_over_variables
  static Widget Function(BuildContext, dynamic, dynamic) defaultError = (_, __, ___) => Container(
        width: 129,
        height: 116,
        color: Colors.grey,
        child: const Center(
          child: Text(
            'Image not found',
            textAlign: TextAlign.center,
          ),
        ),
      );

  const ImageWidget({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.radius = 0,
    this.errorWidget,
    this.placeholder,
    this.color,
  }) : super(key: key);

  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double radius;
  final Widget Function(BuildContext, dynamic, dynamic)? errorWidget;
  final Widget Function(BuildContext)? placeholder;
  final Color? color;

  Widget errorBuilder(BuildContext context, __, ___) {
    return errorWidget?.call(context, __, ___) ??
        Container(
          width: width,
          height: height,
          color: Colors.grey,
          child: const Center(
            child: Text(
              'Image not found',
              textAlign: TextAlign.center,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return errorBuilder(context, null, null);
    }
    final _type = getMediaType(imageUrl);
    if (isTesting && _type == MediaType.network) {
      // ngăn trường hợp test lỗi do khi test không thể sử dụng internet
      return errorBuilder(context, null, null);
    }
    Widget? image;
    if (_type == MediaType.network) {
      image = CachedNetworkImage(
        imageUrl: imageUrl!,
        width: width,
        height: height,
        fit: fit,
        color: color,
        errorWidget: errorBuilder,
        placeholder: placeholder != null ? (context, _) => placeholder!(context) : null,
      );
    } else if (_type == MediaType.asset) {
      image = Image.asset(
        imageUrl!,
        width: width,
        height: height,
        fit: fit,
        color: color,
        errorBuilder: errorBuilder,
        frameBuilder: placeholder != null ? (context, _, __, ___) => placeholder!(context) : null,
      );
    } else if (_type == MediaType.file) {
      image = Image.file(
        File(imageUrl!),
        width: width,
        height: height,
        fit: fit,
        color: color,
        errorBuilder: errorBuilder,
        frameBuilder: placeholder != null ? (context, _, __, ___) => placeholder!(context) : null,
      );
    }
    if (image != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: image,
      );
    }
    return errorBuilder(context, null, null);
  }
}
