import 'package:cathay_hackathon_22/controllers/request_product_controller.dart';
import 'package:cathay_hackathon_22/pages/request/request_detail.dart';
import 'package:cathay_hackathon_22/routes/route_helper.dart';
import 'package:cathay_hackathon_22/utils/colors.dart';
import 'package:cathay_hackathon_22/utils/dimensions.dart';
import 'package:cathay_hackathon_22/widgets/big_text.dart';
import 'package:cathay_hackathon_22/widgets/medium_text.dart';
import 'package:cathay_hackathon_22/widgets/services_menu_header.dart';
import 'package:cathay_hackathon_22/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:searchfield/searchfield.dart';

class RequestMenu extends StatelessWidget {
  const RequestMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final itemQuery = FirebaseFirestore.instance.collection("items");

    final List<String> _suggestions = [
      'Towel',
      'Headphones',
      'Tissues',
    ];

    final _searchController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
          title: BigText(text: "Request"),
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          foregroundColor: AppColors.greyTextColor,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              })),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: SearchField(
              suggestionState: Suggestion.expand,
              suggestionAction: SuggestionAction.next,
              suggestions:
                  _suggestions.map((e) => SearchFieldListItem(e)).toList(),
              textInputAction: TextInputAction.next,
              controller: _searchController,
              // offset: Offset(10, 100),
              hint: 'Search',
              maxSuggestionsInViewPort: 0,
              itemHeight: 45,
              onSuggestionTap: (x) {},
              searchInputDecoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.greyTextColor),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    gapPadding: 4.0,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.greyTextColor),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    gapPadding: 4.0,
                  )),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          Divider(
            height: 20,
            thickness: 1,
            indent: Dimensions.width30,
            endIndent: Dimensions.width30,
            color: AppColors.greyTextColor,
          ),
          GetBuilder<RequestProductController>(builder: (requestProduct) {
            return requestProduct.isLoaded
                ? StreamBuilder(
                    stream: itemQuery.snapshots(),
                    builder: (ctx,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snap) {
                      if (snap.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final docs = snap.data!.docs;
                      return Expanded(
                        child: ListView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: docs.length,
                            itemBuilder: ((context, index) => GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                        RouteHelper.getRequestDetails(index));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: Dimensions.width20,
                                        right: Dimensions.width20,
                                        bottom: Dimensions.height10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 204, 203, 203),
                                              blurRadius: 20.0,
                                              spreadRadius: -10,
                                              offset: Offset(10, 10)),
                                        ]),
                                    child: Row(children: [
                                      //Image section
                                      Container(
                                          width: 120,
                                          height: 110,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.whiteColor,
                                                  style: BorderStyle.solid,
                                                  width: 5),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      bottomLeft:
                                                          Radius.circular(20)),
                                              // color: AppColors.whiteColor,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      docs[index]["image"])))),
                                      //Description section
                                      Expanded(
                                        child: Container(
                                            height: 110,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20)),
                                              color: AppColors.whiteColor,
                                            ),
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: Dimensions.width10,
                                                    right: Dimensions.width20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    MediumText(
                                                      text: docs[index]["name"],
                                                      color: AppColors
                                                          .mainBlackColor,
                                                    ),
                                                    const SizedBox(
                                                      height: 25,
                                                    ),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SmallText(
                                                              text: docs[index][
                                                                          "stock"] ==
                                                                      0
                                                                  ? "Not Available"
                                                                  : "Available"),
                                                          const Icon(
                                                            Icons
                                                                .keyboard_arrow_right,
                                                            size: 35,
                                                          ),
                                                        ])
                                                  ],
                                                ))),
                                      )
                                    ]),
                                  ),
                                ))),
                      );
                    })
                : const SizedBox(
                    height: 10,
                  );
          })
        ],
      ),
    );
  }
}
