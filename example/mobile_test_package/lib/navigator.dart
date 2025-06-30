import 'dart:async';
import 'package:flutter/material.dart';

class CoreServiceNavigator {
  push(
    BuildContext context,
    Widget route,
  ) async {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => route,
      ),
    );
  }

  pushAndRemoveUntil(
    BuildContext context,
    Widget route,
  ) async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => route,
        ),
        (route) => false);
  }

  pop(BuildContext context) {
    Navigator.pop(context);
  }

  Future bottomSheet({
    required BuildContext context,
    required Widget child,
    double? height,
    double? width,
  }) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SafeArea(
              child: Wrap(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: height,
                child: child,
              )
            ],
          ));
        });
  }
}
