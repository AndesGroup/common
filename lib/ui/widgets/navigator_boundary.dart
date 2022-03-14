import 'package:common/utils/helpers.dart';
import 'package:flutter/material.dart';

/// {@template navigator_boundary}
/// Bọc widget trong một [Navigator] riêng biệt, để ví dụ replace nó với 1 widget khác thì sẽ mất
/// toàn bộ các widget và các dialog đang hiện trong [Navigator] đó, thích hợp dùng ở màn hình login
///
/// Lưu ý nên sử dụng thêm [key] để phân biệt trong trường hợp cùng cấp trên cây widget có từ 2
/// widget này trở lên.
/// {@endtemplate}
class NavigatorBoundary extends StatelessWidget {
  /// {@macro navigator_boundary}
  const NavigatorBoundary({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Navigator(onGenerateRoute: (_) {
      return defaultPage(child);
    });
  }
}
