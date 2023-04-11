import 'package:get/get.dart';
import 'package:savmoney_task/ui/controller/dashboard_controller.dart';
import 'package:savmoney_task/ui/controller/home_screen_controller.dart';
import 'package:savmoney_task/ui/controller/product_details_screen_controller.dart';
import 'package:savmoney_task/ui/controller/shop_list_screen_controller.dart';
import 'package:savmoney_task/ui/controller/splash_screen_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController(), fenix: true);
    Get.lazyPut<HomeScreenController>(() => HomeScreenController(),
        fenix: true);
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController(),
        fenix: true);
    Get.lazyPut<ShopListAnimationController>(
        () => ShopListAnimationController(),
        fenix: true);
    Get.lazyPut<SplashScreenAnimationController>(
        () => SplashScreenAnimationController(),
        fenix: true);
  }
}
