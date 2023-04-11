import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savmoney_task/ui/controller/dashboard_controller.dart';
import 'package:savmoney_task/ui/controller/home_screen_controller.dart';
import 'package:savmoney_task/ui/home_screen.dart';
import 'package:savmoney_task/widget/animation_widget.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DashBoardController dashBoardController = Get.find<DashBoardController>();
  HomeScreenController controller = Get.find<HomeScreenController>();
  @override
  void initState() {
    controller.startHomeScreenAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        builder: (DashBoardController controller) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              IndexedStack(
                index: controller.isSelected,
                children: [
                  Container(),
                  HomeScreen(),
                  Container(),
                ],
              ),
              HomeScreenAnimation(
                durationInMs: 1000,
                tAnimatePosition: TAnimatePosition(
                    leftBefore: 0,
                    leftAfter: 0,
                    rightAfter: 0,
                    rightBefore: 0,
                    bottomAfter: -300,
                    bottomBefore: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        dashBoardController.bottomIconList.length,
                        (index) => Icon(
                          dashBoardController.bottomIconList[index],
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
