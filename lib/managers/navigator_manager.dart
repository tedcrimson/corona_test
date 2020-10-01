// import 'package:doers/Pages/loading_page.dart';
// import 'package:beyouteek/widgets/bottom_sheet_fix.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavigatorManager {
  static Future<T> pushPage<T>(BuildContext context, Widget page,
      {bool root = false}) async {
    return Navigator.of(context, rootNavigator: root)
        .push<T>(MaterialPageRoute(builder: (BuildContext context) => page));
  }

  static Future<T1> replacePage<T1, T2>(BuildContext context, Widget page,
      {bool root = false}) {
    return Navigator.of(context, rootNavigator: root).pushReplacement<T1, T2>(
        MaterialPageRoute(builder: (BuildContext context) => page));
  }

  // static PersistentBottomSheetController showBottomPanel<T>(
  //     BuildContext context, Widget widget,
  //     {bool popLast = false}) {
  //   if (popLast) Navigator.of(context).pop();
  //   return showBottomSheet<T>(
  //       context: context, builder: (BuildContext context) => widget);
  // }

  static Future<T1> replacePageWithName<T1, T2>(
      BuildContext context, String routeName,
      {bool root = false, Object args}) {
    return Navigator.of(context, rootNavigator: root)
        .pushReplacementNamed<T1, T2>(routeName, arguments: args);
  }

  static Future<T> pushPageWithName<T>(BuildContext context, String routeName,
      {bool root = false, Object args}) {
    return Navigator.of(context, rootNavigator: root)
        .pushNamed<T>(routeName, arguments: args);
  }

  static Future<T> loadRoute<T>(BuildContext context,
      {Widget child, bool root = false}) {
    return Navigator.of(context, rootNavigator: root).push<T>(PageRouteBuilder(
        maintainState: true,
        barrierDismissible: false,
        opaque: false,
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return child;
        }));
  }
  // static Future<T> loadRoute<T>(BuildContext context,
  //     {Future<T> Function() onLoad,
  //     VoidCallback onTimeout,
  //     ValueChanged<PlatformException> onError,
  //     bool root = false,
  //     int duration = 20}) {
  //   return Navigator.of(context, rootNavigator: root).push<T>(PageRouteBuilder(
  //       maintainState: true,
  //       barrierDismissible: false,
  //       opaque: false,
  //       pageBuilder: (BuildContext context, Animation animation,
  //           Animation secondaryAnimation) {
  //         return LoadingPage<T>(
  //           onLoad: onLoad,
  //           onTimeout: onTimeout,
  //           onError: onError,
  //           duration: duration,
  //         );
  //       }));
  // }
}
