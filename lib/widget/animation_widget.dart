import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/controller/home_screen_controller.dart';
import '../ui/controller/product_details_screen_controller.dart';
import '../ui/controller/shop_list_screen_controller.dart';
import '../ui/controller/splash_screen_controller.dart';

class HomeScreenAnimation extends StatelessWidget {
  HomeScreenAnimation(
      {Key? key,
      required this.durationInMs,
      required this.tAnimatePosition,
      required this.child})
      : super(key: key);

  final int durationInMs;
  final TAnimatePosition tAnimatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (HomeScreenController controller) {
        return AnimatedPositioned(
          top: controller.animate
              ? tAnimatePosition.topAfter
              : tAnimatePosition.topBefore,
          right: controller.animate
              ? tAnimatePosition.rightAfter
              : tAnimatePosition.rightBefore,
          bottom: controller.animate
              ? tAnimatePosition.bottomAfter
              : tAnimatePosition.bottomBefore,
          left: controller.animate
              ? tAnimatePosition.leftAfter
              : tAnimatePosition.leftBefore,
          duration: Duration(milliseconds: durationInMs),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: durationInMs),
            opacity: controller.animate ? 0 : 1,
            child: child,
          ),
        );
      },
    );
  }
}

class ProductDetailsScreenAnimation extends StatelessWidget {
  ProductDetailsScreenAnimation(
      {Key? key,
      required this.durationInMs,
      required this.tAnimatePosition,
      required this.child})
      : super(key: key);

  final int durationInMs;
  final TAnimatePosition tAnimatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (ProductDetailsController controller) {
        return AnimatedPositioned(
          top: controller.animate
              ? tAnimatePosition.topAfter
              : tAnimatePosition.topBefore,
          right: controller.animate
              ? tAnimatePosition.rightAfter
              : tAnimatePosition.rightBefore,
          bottom: controller.animate
              ? tAnimatePosition.bottomAfter
              : tAnimatePosition.bottomBefore,
          left: controller.animate
              ? tAnimatePosition.leftAfter
              : tAnimatePosition.leftBefore,
          duration: Duration(milliseconds: durationInMs),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: durationInMs),
            opacity: controller.animate ? 0 : 1,
            child: child,
          ),
        );
      },
    );
  }
}

class ShopListScreenAnimation extends StatelessWidget {
  ShopListScreenAnimation(
      {Key? key,
      required this.durationInMs,
      required this.tAnimatePosition,
      required this.child})
      : super(key: key);

  final int durationInMs;
  final TAnimatePosition tAnimatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (ShopListAnimationController controller) {
        return AnimatedPositioned(
          top: controller.animate
              ? tAnimatePosition.topAfter
              : tAnimatePosition.topBefore,
          right: controller.animate
              ? tAnimatePosition.rightAfter
              : tAnimatePosition.rightBefore,
          bottom: controller.animate
              ? tAnimatePosition.bottomAfter
              : tAnimatePosition.bottomBefore,
          left: controller.animate
              ? tAnimatePosition.leftAfter
              : tAnimatePosition.leftBefore,
          duration: Duration(milliseconds: durationInMs),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: durationInMs),
            opacity: controller.animate ? 0 : 1,
            child: child,
          ),
        );
      },
    );
  }
}

class SplashScreenAnimation extends StatelessWidget {
  SplashScreenAnimation(
      {Key? key,
      required this.durationInMs,
      required this.tAnimatePosition,
      required this.child})
      : super(key: key);

  final int durationInMs;
  final TAnimatePosition tAnimatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (SplashScreenAnimationController controller) {
        return AnimatedPositioned(
          top: controller.animate
              ? tAnimatePosition.topAfter
              : tAnimatePosition.topBefore,
          right: controller.animate
              ? tAnimatePosition.rightAfter
              : tAnimatePosition.rightBefore,
          bottom: controller.animate
              ? tAnimatePosition.bottomAfter
              : tAnimatePosition.bottomBefore,
          left: controller.animate
              ? tAnimatePosition.leftAfter
              : tAnimatePosition.leftBefore,
          duration: Duration(milliseconds: durationInMs),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: durationInMs),
            opacity: controller.animate ? 0 : 1,
            child: child,
          ),
        );
      },
    );
  }
}

class TAnimatePosition {
  final double? topBefore, bottomBefore, leftBefore, rightBefore;
  final double? topAfter, bottomAfter, leftAfter, rightAfter;
  TAnimatePosition(
      {this.topBefore,
      this.bottomBefore,
      this.leftBefore,
      this.rightBefore,
      this.topAfter,
      this.leftAfter,
      this.rightAfter,
      this.bottomAfter});
}
