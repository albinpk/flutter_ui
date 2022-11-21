import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class SlidePageRoute extends PageRouteBuilder {
  SlidePageRoute({required WidgetBuilder builder})
      : super(
          pageBuilder: (context, _, __) => builder(context),
        );

  @override
  RouteTransitionsBuilder get transitionsBuilder =>
      (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.ease,
            ),
          ),
          child: child,
        );
      };
}
