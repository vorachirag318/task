import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savmoney_task/ui/dashboard_screen.dart';
import 'package:savmoney_task/widget/animation_widget.dart';

import 'controller/splash_screen_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenAnimationController splashScreenAnimationController =
      Get.find<SplashScreenAnimationController>();
  @override
  void initState() {
    splashScreenAnimationController.startSplashScreenListScreenAnimation();
    splashScreenNavigate();
    super.initState();
  }

  void splashScreenNavigate() async {
    await Future.delayed(const Duration(seconds: 3));
    splashScreenAnimationController.startSplashScreenListScreenAnimation();
    await Future.delayed(const Duration(seconds: 1));

    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0)
                .chain(CurveTween(curve: Curves.ease))
                .animate(animation),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) =>
            DashBoardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdba166),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          SplashScreenAnimation(
            durationInMs: 1000,
            tAnimatePosition: TAnimatePosition(
                leftBefore: 20, leftAfter: 180, topBefore: 70, topAfter: 70),
            child: Text("Razoros",
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold)),
          ),
          SplashScreenAnimation(
            durationInMs: 1000,
            tAnimatePosition: TAnimatePosition(
                rightBefore: 20,
                rightAfter: 180,
                topBefore: 150,
                topAfter: 150),
            child: Text(
              "Collection",
              style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SplashScreenAnimation(
              durationInMs: 1000,
              tAnimatePosition: TAnimatePosition(
                  rightBefore: 0,
                  rightAfter: 0,
                  leftBefore: 0,
                  leftAfter: 0,
                  topBefore: 280,
                  topAfter: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: index == 1
                        ? CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.black,
                          )
                        : CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.black.withOpacity(0.3),
                          ),
                  ),
                ),
              )),
          SplashScreenAnimation(
            durationInMs: 1000,
            tAnimatePosition: TAnimatePosition(
                bottomAfter: -200,
                bottomBefore: 0,
                rightAfter: 0,
                rightBefore: 0,
                leftAfter: 0,
                leftBefore: 0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
              child: Container(
                height: 350,
                color: Color(0xFFc6cfcb),
                child: Stack(
                  children: [
                    Center(child: Image.asset("assets/Images/shop4.png")),
                    SplashScreenAnimation(
                      durationInMs: 1000,
                      tAnimatePosition: TAnimatePosition(
                          bottomBefore: 30,
                          rightBefore: 20,
                          rightAfter: 20,
                          bottomAfter: -200),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          height: 70,
                          width: 70,
                          color: Colors.black,
                          child: Center(
                              child: Icon(
                            Icons.bookmark_add_rounded,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
