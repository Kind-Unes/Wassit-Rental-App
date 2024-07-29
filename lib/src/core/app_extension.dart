import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

extension StringExtension on String {
  String get capitalize {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String get capitalizeFirstofEach {
    return split(" ").map((str) => str.capitalize).join(" ");
  }
}

extension BottomSheetExtension on BuildContext {
  void showCustomBottomSheet({
    required Widget Function(BuildContext) builder,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    RouteSettings? routeSettings,
  }) {
    showModalBottomSheet(
      context: this,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
    );
  }
}

extension PushNamed on BuildContext {
  void pushNamed(
    String route, {
    Object? arguments,
  }) {
    Navigator.pushNamed(
      this,
      route,
      arguments: {
        "data": arguments,
      },
    );
  }
}

extension Pop on BuildContext {
  void pop() {
    Navigator.pop(this);
  }
}

extension Push on BuildContext {
  void push(Widget page) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => page));
  }
}

extension PushReplacement on BuildContext {
  void pushReplacement(Widget page) {
    Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (context) => page));
  }
}

extension PushReplacementNamedp on BuildContext {
  void pushReplacementNamed(String route) {
    Navigator.pushReplacementNamed(this, route);
  }
}

extension PushAndRemoveUntil on BuildContext {
  void pushNamedAndRemoveUntil(String route) {
    Navigator.pushNamedAndRemoveUntil(
      this,
      route,
      (route) => false,
    );
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery {
    return MediaQuery.of(this);
  }
}

extension SizeExtension on BuildContext {
  Size get size {
    return MediaQuery.of(this).size;
  }
}

extension WidthExtension on BuildContext {
  double get width {
    return MediaQuery.of(this).size.width;
  }
}

extension HeightExtension on BuildContext {
  double get height {
    return MediaQuery.of(this).size.height;
  }
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }
}

extension FucusOff on BuildContext {
  void unfocus() {
    FocusScope.of(this).unfocus();
  }
}

extension OrientationExtension on BuildContext {
  Orientation get orientation {
    return MediaQuery.of(this).orientation;
  }
}
