import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savmoney_task/ui/controller/shop_list_screen_controller.dart';
import 'package:savmoney_task/widget/animation_widget.dart';

class ShopListScreen extends StatefulWidget {
  const ShopListScreen({Key? key}) : super(key: key);

  @override
  State<ShopListScreen> createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  Animation? sizeAnimation;
  Animation? sizeAnimation2;
  ShopListAnimationController shopListAnimationController =
      Get.find<ShopListAnimationController>();

  @override
  void initState() {
    shopListAnimationController.startShopListScreenAnimation();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _controller2 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    sizeAnimation = Tween<double>(begin: 0, end: 50).animate(_controller2);
    sizeAnimation2 = Tween<double>(begin: 20, end: 140).animate(_controller2);
    _controller2.addListener(() {
      setState(() {});
    });
    _controller.forward();
    _controller2.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFc6cfcb),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined)),
            ),
            ShopListScreenAnimation(
              durationInMs: 1000,
              tAnimatePosition: TAnimatePosition(
                  rightBefore: 20, rightAfter: 100, topBefore: 0, topAfter: 0),
              child: GestureDetector(
                onTap: () {
                  // tFadeAnimationController3.startShopListScreenAnimation();
                },
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                ),
              ),
            ),
            ShopListScreenAnimation(
              durationInMs: 700,
              tAnimatePosition: TAnimatePosition(
                  rightBefore: 0, leftBefore: 0, topBefore: 50, topAfter: 300),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    height: 120,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: const Color(0xFFc6cfcb),
                              child: Image.asset("assets/Images/shop1.png"),
                            ),
                          ),
                          ShopListScreenAnimation(
                            durationInMs: 1000,
                            tAnimatePosition: TAnimatePosition(
                                leftBefore: 120,
                                leftAfter: 200,
                                topBefore: 0,
                                topAfter: 0,
                                bottomBefore: 0,
                                bottomAfter: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Grampus",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Bluetooth earphone",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "\$100.25",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          ShopListScreenAnimation(
                            durationInMs: 1000,
                            tAnimatePosition: TAnimatePosition(
                                rightBefore: 10,
                                rightAfter: 10,
                                topBefore: 0,
                                topAfter: 130),
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (_, child) {
                                return Transform.rotate(
                                  angle: _controller.value * 2 * math.pi,
                                  child: child,
                                );
                              },
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.black,
                                child: Center(
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ),
                          ),
                          ShopListScreenAnimation(
                            durationInMs: 1000,
                            tAnimatePosition: TAnimatePosition(
                                rightBefore: 15,
                                rightAfter: 15,
                                topBefore: 0,
                                bottomAfter: 0,
                                bottomBefore: 0,
                                topAfter: 150),
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (_, child) {
                                return Transform.rotate(
                                  angle: _controller.value * 2 * math.pi,
                                  child: child,
                                );
                              },
                              child: Center(
                                child: Text(
                                  "1 ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          ShopListScreenAnimation(
                            durationInMs: 1000,
                            tAnimatePosition: TAnimatePosition(
                                rightBefore: 10,
                                rightAfter: 10,
                                bottomAfter: -80,
                                bottomBefore: 0),
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (_, child) {
                                return Transform.rotate(
                                  angle: _controller.value * 2 * math.pi,
                                  child: child,
                                );
                              },
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  radius: 13,
                                  backgroundColor: Colors.white,
                                  child: Center(child: Icon(Icons.remove)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ShopListScreenAnimation(
              durationInMs: 1000,
              tAnimatePosition: TAnimatePosition(
                  rightBefore: 0, leftBefore: 0, topBefore: 200, topAfter: 400),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    height: 120,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: const Color(0xFFc6cfcb),
                              child: Image.asset("assets/Images/shop3.png"),
                            ),
                          ),
                          ShopListScreenAnimation(
                            durationInMs: 1000,
                            tAnimatePosition: TAnimatePosition(
                                leftBefore: 120,
                                leftAfter: 200,
                                topBefore: 0,
                                topAfter: 0,
                                bottomBefore: 0,
                                bottomAfter: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "JellyFish",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Bluetooth earphone",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "\$120.25",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          ShopListScreenAnimation(
                            durationInMs: 1000,
                            tAnimatePosition: TAnimatePosition(
                                rightBefore: 10,
                                rightAfter: 10,
                                topBefore: 0,
                                topAfter: 130),
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (_, child) {
                                return Transform.rotate(
                                  angle: _controller.value * 2 * math.pi,
                                  child: child,
                                );
                              },
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.black,
                                child: Center(
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ),
                          ),
                          ShopListScreenAnimation(
                            durationInMs: 1000,
                            tAnimatePosition: TAnimatePosition(
                                rightBefore: 15,
                                rightAfter: 15,
                                topBefore: 0,
                                bottomAfter: 0,
                                bottomBefore: 0,
                                topAfter: 150),
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (_, child) {
                                return Transform.rotate(
                                  angle: _controller.value * 2 * math.pi,
                                  child: child,
                                );
                              },
                              child: Center(
                                child: Text(
                                  "1 ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          ShopListScreenAnimation(
                            durationInMs: 1000,
                            tAnimatePosition: TAnimatePosition(
                                rightBefore: 10,
                                rightAfter: 10,
                                bottomAfter: -80,
                                bottomBefore: 0),
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (_, child) {
                                return Transform.rotate(
                                  angle: _controller.value * 2 * math.pi,
                                  child: child,
                                );
                              },
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  radius: 13,
                                  backgroundColor: Colors.white,
                                  child: Center(child: Icon(Icons.remove)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ShopListScreenAnimation(
              durationInMs: 1000,
              tAnimatePosition: TAnimatePosition(
                  rightBefore: 0,
                  leftBefore: 0,
                  topBefore: 350,
                  topAfter: 1000),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Container(
                    height: 70,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text("FAVUEMCKFHEOIFMD",
                            style: TextStyle(fontSize: 16)),
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Container(
                            height: sizeAnimation!.value,
                            width: sizeAnimation2!.value,
                            color: Colors.black,
                            child: Center(
                                child: Text(
                              "Buy Now",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
