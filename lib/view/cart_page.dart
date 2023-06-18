import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart' as FI;
import 'package:get/get.dart';
import 'package:shopping/constants.dart';
import 'package:shopping/controller/cart_controller.dart';
import 'package:shopping/view/checkout_page.dart';
import 'package:shopping/view/home_page.dart';
import 'package:shopping/view/signup_page.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatelessWidget {
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kContainerBackgroundColor,
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text('Cart Summery',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0, color: Colors.black)
                  ),
                      const SizedBox(height: 10.0),
                      wItemList(context),
                      const SizedBox(height: 20.0),
                      Text(
                        'Total cart value:\tRs.\t${controller.totalPrice} /-',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0, color: Colors.black)
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(

                          onPressed: () {
                            Get.off(() => CheckoutPage());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Checkout",
                              style: TextStyle(color: Colors.white, fontSize: 12.0.sp),
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(kContainerBackgroundColor)),
                        ),
                      ),
                    ],
                  ),

                ),
            );
  }

  Widget wItemList(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() => controller.items.length == 0
        ? Center(
            child: Text("Your Cart is Empty"),
          )
        : ListView.builder(
            itemCount: controller.items.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xFFFFFFFF),
                          const Color(0xB0E7E9E7),
                        ],
                        begin: Alignment(0.2, 0.0),
                        end: Alignment(1.0, 0.0),
                        tileMode: TileMode.clamp),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Image.network(
                      controller.items[index].image,
                      width: size.width / 4,
                      height: size.width / 4,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.items[index].title),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(" Rs.\t"+
                                controller.items[index].price.toString(),
                                style: TextStyle(
                                    fontSize: 12.0.sp,
                                    color: kContainerBackgroundColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              FloatingActionButton(
                                backgroundColor: kContainerBackgroundColor,
                                onPressed: () {
                                  controller
                                      .deleteItem(controller.items[index]);
                                },
                                child: Icon(
                                  FI.AntDesign.delete,
                                  size: 20,
                                ),
                                mini: true,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                heroTag: null,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),


              );
            })



    );
  }
}
