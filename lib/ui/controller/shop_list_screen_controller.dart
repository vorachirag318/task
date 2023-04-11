import 'package:get/get.dart';

class ShopListAnimationController extends GetxController {
  bool _animate = false;

  bool get animate => _animate;

  set animate(bool value) {
    _animate = value;
    update();
  }

  Future startShopListScreenAnimation() async {
    _animate = true;
    update();
    await Future.delayed(Duration(milliseconds: 1000));
    _animate = false;
    update();
  }
}
