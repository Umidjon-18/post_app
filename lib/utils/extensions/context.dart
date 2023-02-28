import 'package:flutter/material.dart';

import '../../core/resources/dimens.dart';
import '../../core/resources/palette.dart';
import '../../core/widgets/loading.dart';

extension ContextExtensions on BuildContext {
  // Navigator.pop
  dynamic back([dynamic result]) => Navigator.pop(this);

  // Navigator.pushNamed
  Future<dynamic> goTo(String routeName, {Object? args}) {
    return Navigator.pushNamed(this, routeName);
  }

  // Navigator.pushReplacementNamed
  Future<dynamic> goToReplace(String routeName, {Object? args}) {
    return Navigator.pushReplacementNamed(this, routeName);
  }

  // Navigator.pushNamedAndRemoveUntil
  Future<dynamic> goToClearStack(String routeName, {Object? args}) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      routeName,
      (route) => false,
      arguments: args,
    );
  }

  // ShowDialog
  static late BuildContext ctx;

  Future<void> show() => showDialog(
        context: this,
        builder: (c) {
          ctx = c;
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.circular(Dimens.cornerRadius),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: Dimens.space30),
                  padding: EdgeInsets.all(Dimens.space24),
                  child: Wrap(children: const [Loading()]),
                ),
              ),
            ),
          );
        },
      );

  void dispose() {
    try {
      Navigator.pop(ctx);
    } catch (_) {}
  }
}
