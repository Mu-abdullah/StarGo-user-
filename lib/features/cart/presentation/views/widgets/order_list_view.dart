import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:user/core/utils/assets.dart';

import '../../../../../core/utils/texts.dart';
import '../../../data/model/cart_model/cart_model.dart';
import 'order_list_view_item.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({
    super.key,
    required this.order,
  });

  final List<CartModel> order;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: order.isEmpty
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Lottie.asset("assets/animation_json/no_item.json"),
                    const TitleTexts(
                      text: "لا يوجد اصناف 😭",
                      fontFamily: AssetDate.messiriFont,
                    ),
                    const SubTitleTexts(
                      text: "خطوة للوراء لملئ العربة 😁",
                      fontFamily: AssetDate.messiriFont,
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: order.length,
              itemBuilder: (context, index) {
                return OrderListViewItem(
                  order: order[index],
                );
              },
            ),
    );
  }
}
