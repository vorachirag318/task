import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savmoney_task/ui/shop_list_screen.dart';
import 'package:savmoney_task/widget/animation_widget.dart';

import 'controller/product_details_screen_controller.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String heroKey;

  const ProductDetailsScreen({Key? key, required this.heroKey})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? sizeAnimation;
  Animation? sizeAnimation2;
  Animation? sizeAnimation3;
  Animation? sizeAnimation4;
  ProductDetailsController controller = Get.find<ProductDetailsController>();

  @override
  void initState() {
    super.initState();
    controller.startProductDetailsScreenAnimation();
    // Defining controller with animation duration of two seconds
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    // Defining both color and size animations

    sizeAnimation =
        Tween<double>(begin: 56, end: 65).animate(animationController!);
    sizeAnimation3 =
        Tween<double>(begin: 0, end: 60).animate(animationController!);
    sizeAnimation4 =
        Tween<double>(begin: 20, end: 190).animate(animationController!);

    sizeAnimation2 =
        Tween<double>(begin: 185, end: 195).animate(animationController!);

    // Rebuilding the screen when animation goes ahead
    animationController!.addListener(() {
      setState(() {});
    });

    // Repeat the animation after finish
    animationController!.repeat(reverse: true);

    //For single time
    //controller.forward()

    //Reverses the animation instead of starting it again and repeats
    //controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFc6cfcb),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: 0,
            child: Hero(
              tag: widget.heroKey,
              child: Image.asset(widget.heroKey, height: 400),
            ),
          ),
          ProductDetailsScreenAnimation(
            durationInMs: 700,
            tAnimatePosition: TAnimatePosition(
                leftAfter: -80, leftBefore: 10, topBefore: 5, topAfter: 5),
            child: SafeArea(
              child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined)),
            ),
          ),
          Center(
              child: Stack(
            alignment: Alignment.center,
            children: [
              ProductDetailsScreenAnimation(
                durationInMs: 700,
                tAnimatePosition: TAnimatePosition(
                  topBefore: 380,
                  topAfter: 800,
                ),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.black,
                ),
              ),
              ProductDetailsScreenAnimation(
                durationInMs: 700,
                tAnimatePosition: TAnimatePosition(
                    topBefore: 380,
                    topAfter: 1000,
                    leftBefore: 0,
                    rightBefore: 40,
                    leftAfter: -20),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.black.withOpacity(0.5),
                ),
              ),
              ProductDetailsScreenAnimation(
                durationInMs: 700,
                tAnimatePosition: TAnimatePosition(
                    topBefore: 380,
                    topAfter: 800,
                    leftBefore: 40,
                    rightBefore: 0,
                    leftAfter: -20),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          )),
          ProductDetailsScreenAnimation(
            durationInMs: 700,
            tAnimatePosition: TAnimatePosition(
                topBefore: 400, topAfter: 800, leftAfter: 200, leftBefore: 20),
            child: Text(
              "Power Bank",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ProductDetailsScreenAnimation(
            durationInMs: 700,
            tAnimatePosition: TAnimatePosition(
              topBefore: 450,
              topAfter: 1000,
              leftAfter: 200,
              leftBefore: 20,
              rightAfter: -200,
            ),
            child: Text(
              "Ambrane 10000mAh Slim Power Bank, 20W Fast \nCharging, Dual Output, Type C PD (Input & Output),\nQuick Charge, Li-Polymer, Multi-Layer Protection",
              style: TextStyle(fontSize: 15),
            ),
          ),
          ProductDetailsScreenAnimation(
            durationInMs: 700,
            tAnimatePosition: TAnimatePosition(
              topBefore: 520,
              topAfter: 1200,
              leftAfter: 200,
              leftBefore: 20,
              rightAfter: -200,
            ),
            child: Text(
              "Upto 80% off on Bluetooth Headphones at \nIndia's Best Online Shopping Store. Buy and \nexplore a wide range of Bluetooth earphones.",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15),
            ),
          ),
          ProductDetailsScreenAnimation(
            durationInMs: 700,
            tAnimatePosition: TAnimatePosition(
              bottomAfter: -800,
              bottomBefore: 0,
              leftAfter: 0,
              rightAfter: 0,
            ),
            child: GetBuilder(
              builder: (ProductDetailsController controller) {
                return ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Stack(children: [
                      SizedBox(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                      ),
                      ProductDetailsScreenAnimation(
                        durationInMs: 1000,
                        tAnimatePosition: TAnimatePosition(
                          topBefore: 10,
                          topAfter: 100,
                          rightBefore: 40,
                          rightAfter: 0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            controller.startProductDetailsScreenAnimation();

                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 500),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: Tween(begin: 0.0, end: 1.0)
                                        .chain(CurveTween(curve: Curves.ease))
                                        .animate(animation),
                                    child: child,
                                  );
                                },
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        ShopListScreen(),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                        ),
                      ),
                      ProductDetailsScreenAnimation(
                          durationInMs: 1000,
                          tAnimatePosition: TAnimatePosition(
                              topAfter: 100,
                              topBefore: 10,
                              leftAfter: 0,
                              leftBefore: 20),
                          child: Text(
                            "Total price",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          )),
                      ProductDetailsScreenAnimation(
                        durationInMs: 1000,
                        tAnimatePosition: TAnimatePosition(
                            topAfter: 100,
                            topBefore: 33,
                            leftAfter: 0,
                            leftBefore: 20),
                        child: Text(
                          "\$${"122.580"}",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      )
                    ]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
