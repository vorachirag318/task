import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:savmoney_task/ui/controller/home_screen_controller.dart';
import 'package:savmoney_task/ui/product_details_screen.dart';
import 'package:savmoney_task/widget/animation_widget.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ItemModel> _imageCategoryList = [
    ItemModel(
      image: "assets/Images/shop1.png",
      title: "Power Bank",
      price: "126.00",
      subTitle: "Battery in mobile phone",
    ),
    ItemModel(
      image: "assets/Images/shop3.png",
      title: "Power Bank",
      price: "126.00",
      subTitle: "Battery in mobile phone",
    ),
    ItemModel(
      image: "assets/Images/shop4.png",
      title: "Power Bank",
      price: "126.00",
      subTitle: "Battery in mobile phone",
    ),
    ItemModel(
      image: "assets/Images/shop5.png",
      title: "Power Bank",
      price: "126.00",
      subTitle: "Battery in mobile phone",
    ),
    ItemModel(
      image: "assets/Images/shop6.png",
      title: "Power Bank",
      price: "126.00",
      subTitle: "Battery in mobile phone",
    ),
    ItemModel(
      image: "assets/Images/shop7.png",
      title: "Power Bank",
      price: "126.00",
      subTitle: "Battery in mobile phone",
    ),
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFc6cfcb),
      child: SafeArea(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          HomeScreenAnimation(
            durationInMs: 1000,
            tAnimatePosition: TAnimatePosition(
                leftBefore: 20, leftAfter: -30, topBefore: 0, topAfter: -30),
            child: Icon(
              Icons.menu,
              size: 30,
            ),
          ),
          HomeScreenAnimation(
            durationInMs: 1000,
            tAnimatePosition: TAnimatePosition(
                rightBefore: 20, rightAfter: -30, topBefore: 0, topAfter: -30),
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
            ),
          ),
          HomeScreenAnimation(
            durationInMs: 1000,
            tAnimatePosition: TAnimatePosition(
                leftBefore: 20, leftAfter: 200, topBefore: 40, topAfter: 40),
            child: Row(
              children: [
                chipButton("All", true),
                SizedBox(
                  width: 10,
                ),
                chipButton("Mobile Controller", false),
              ],
            ),
          ),
          HomeScreenAnimation(
            durationInMs: 1000,
            tAnimatePosition: TAnimatePosition(
                leftBefore: 20, leftAfter: -200, topBefore: 90, topAfter: 90),
            child: Row(
              children: [
                chipButton("Razorose", false),
                SizedBox(
                  width: 10,
                ),
                chipButton("Contstrained Ball", false),
              ],
            ),
          ),
          HomeScreenAnimation(
            durationInMs: 1000,
            tAnimatePosition: TAnimatePosition(
                leftBefore: 20,
                leftAfter: -200,
                topBefore: 150,
                topAfter: 550,
                rightAfter: 0,
                rightBefore: 0),
            child: SizedBox(
                height: 260,
                child: ScrollSnapList(
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            HomeScreenController controller =
                                Get.find<HomeScreenController>();
                            controller.startHomeScreenAnimation();
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(seconds: 1),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: Tween(begin: 0.0, end: 1.0)
                                          .chain(CurveTween(curve: Curves.ease))
                                          .animate(animation),
                                      child: child,
                                    );
                                  },
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      ProductDetailsScreen(
                                    heroKey: _imageCategoryList[index].image,
                                  ),
                                ));
                          },
                          child: Hero(
                            tag: _imageCategoryList[index].image,
                            transitionOnUserGestures: false,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: Container(
                                width: 190,
                                height: 190,
                                child: Center(
                                  child: Image.asset(
                                    _imageCategoryList[index].image,
                                  ),
                                ),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _imageCategoryList[index].title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$${_imageCategoryList[index].price}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text(_imageCategoryList[index].subTitle),
                          ],
                        )
                      ],
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: _imageCategoryList.length,
                  selectedItemAnchor: SelectedItemAnchor.START,
                  itemSize: 120,
                  dynamicItemSize: true,
                  updateOnScroll: false,
                  curve: Curves.ease,
                  initialIndex: 0,
                  duration: 1000,
                  focusToItem: (p0) {},
                  onItemFocus: (i) {
                    selected = i;
                    setState(() {});
                    print("===========> ${i}");
                  },
                )),
          ),
          HomeScreenAnimation(
            durationInMs: 1000,
            tAnimatePosition: TAnimatePosition(
              leftBefore: 20,
              leftAfter: -200,
              topBefore: 400,
              rightAfter: 0,
              rightBefore: 0,
              topAfter: 850,
            ),
            child: SizedBox(
                height: 260,
                child: ScrollSnapList(
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () async {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Container(
                              width: 190,
                              height: 190,
                              child: Center(
                                child: Image.asset(
                                  _imageCategoryList[index].image,
                                ),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _imageCategoryList[index].title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$${_imageCategoryList[index].price}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text(_imageCategoryList[index].subTitle),
                          ],
                        )
                      ],
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: _imageCategoryList.length,
                  selectedItemAnchor: SelectedItemAnchor.START,
                  itemSize: 120,
                  dynamicItemSize: true,
                  updateOnScroll: false,
                  curve: Curves.ease,
                  initialIndex: 0,
                  duration: 1000,
                  focusToItem: (p0) {},
                  onItemFocus: (i) {
                    selected = i;
                    setState(() {});
                    print("===========> ${i}");
                  },
                )),
          ),
        ]),
      ),
    );
  }

  Widget chipButton(String name, bool selected) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Container(
        color: selected ? Colors.black.withOpacity(0.8) : Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: Text(name,
                  style:
                      TextStyle(color: selected ? Colors.white : Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundColor: Colors.orange,
                radius: 15,
                child: Icon(
                  Icons.add,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemModel {
  String image;
  String title;
  String price;
  String subTitle;
  ItemModel(
      {required this.image,
      required this.title,
      required this.price,
      required this.subTitle});
}
