import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FadePageRoute<T> extends MaterialPageRoute<T> {

  FadePageRoute({
    @required WidgetBuilder builder,
    @required RouteSettings settings
  }) : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {

    if (settings.isInitialRoute) {
      return child;
    }
    // Fades between routes. (If you don't want any animation, just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}