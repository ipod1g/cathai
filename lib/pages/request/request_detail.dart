import 'package:cathay_hackathon_22/controllers/request_product_controller.dart';
import 'package:cathay_hackathon_22/utils/colors.dart';
import 'package:cathay_hackathon_22/widgets/app_icon.dart';
import 'package:cathay_hackathon_22/widgets/item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../routes/route_helper.dart';
import '../../utils/dimensions.dart';
import '../../widgets/medium_text.dart';
import '../../widgets/bottom_navbar.dart';

class RequestDetails extends StatefulWidget {
  int pageId;
  RequestDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  State<RequestDetails> createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails>
    with AutomaticKeepAliveClientMixin {
  int toAdd = 0;
  @override
  bool get wantKeepAlive => true;
  final itemQuery = FirebaseFirestore.instance.collection("items");

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
        stream: itemQuery.snapshots(),
        builder:
            (ctx, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = snap.data!.docs;
          return Scaffold(
              body: Stack(
                children: [
                  //background img
                  Positioned(
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.maxFinite,
                        height: Dimensions.detailsBgSize,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    docs[widget.pageId]["image"]))),
                      )),
                  //top icons
                  Positioned(
                      top: Dimensions.height40,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const AppIcon(
                                  icon: Icons.arrow_back_rounded)),
                          const AppIcon(icon: Icons.shopping_cart_outlined)
                        ],
                      )),
                  //description
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: Dimensions.detailsBgSize - 55,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            top: Dimensions.height10),
                        decoration:
                            const BoxDecoration(color: AppColors.whiteColor),
                        child: Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height15, left: 15, right: 15),
                            child: ItemDetails(
                              item: docs[widget.pageId]["name"],
                              itemDescription: docs[widget.pageId]
                                  ["description"],
                              prepTime: docs[widget.pageId]["duration"],
                              stockStatus: docs[widget.pageId]["stock"],
                              rating: 3,
                              price: 0,
                            )),
                      ))
                ],
              ),
              bottomNavigationBar: Container(
                  height: 160,
                  color: AppColors.whiteColor,
                  child: Stack(children: [
                    Positioned(
                      height: 100,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height15,
                            bottom: Dimensions.height20,
                            left: Dimensions.width30,
                            right: Dimensions.width20),
                        decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 204, 203, 203),
                                  blurRadius: 20.0,
                                  spreadRadius: -10,
                                  offset: Offset(0, -17)),
                            ]),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        toAdd == 0 ? toAdd += 0 : toAdd -= 1;
                                      });
                                    },
                                    child: const AppIcon(
                                        size: 35,
                                        icon: Icons.remove,
                                        iconColor: AppColors.whiteColor,
                                        backgroundColor:
                                            AppColors.mediumGreenColor),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width15,
                                  ),
                                  MediumText(
                                      text: toAdd.toString(),
                                      color: AppColors.mainBlackColor),
                                  SizedBox(
                                    width: Dimensions.width15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        toAdd += 1;
                                      });
                                    },
                                    child: const AppIcon(
                                        size: 35,
                                        icon: Icons.add,
                                        iconColor: AppColors.whiteColor,
                                        backgroundColor:
                                            AppColors.mediumGreenColor),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: Dimensions.height20,
                                    bottom: Dimensions.height20,
                                    left: Dimensions.width20,
                                    right: Dimensions.width20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                    color: AppColors.greenColor),
                                child: GestureDetector(
                                  onTap: () {
                                    FirebaseFirestore.instance
                                        .collection('items')
                                        .doc(docs[widget.pageId]['name'])
                                        .update({
                                      'stock': FieldValue.increment(-toAdd)
                                    });
                                    setState(() {
                                      toAdd = 0;
                                    });

                                    _showDialog(context);
                                  },
                                  child: MediumText(
                                    text: "Confirm",
                                    color: AppColors.whiteColor,
                                    size: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ])));
        });
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirmed"),
        content: Text("Your request has been made"),
        actions: <Widget>[
          ElevatedButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
