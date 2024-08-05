import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSlidePageRoute extends CustomTransitionPage {
  final Widget page;
  final AxisDirection direction;
  CustomSlidePageRoute({
    required this.page,
    this.direction = AxisDirection.right,
  }) : super(
          child: page,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            var begin = const Offset(1.0, 0.0);
            if (direction == AxisDirection.left) {
              begin = const Offset(-1.0, 0.0);
            }
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
