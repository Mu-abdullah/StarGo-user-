import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/size.dart';
import '../../../data/model/cart_model/cart_model.dart';
import 'receipt_item.dart';

class ReceiptOrderListView extends StatelessWidget {
  const ReceiptOrderListView({
    super.key,
    required this.order,
  });

  final List<CartModel> order;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        width: CustomSize().widthSize(context, .85),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.mintGreenColor.withOpacity(.2)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: order.length,
            itemBuilder: (context, index) {
              return ReceiptOrder(cart: order[index]);
            },
          ),
        ),
      ),
    );
  }
}
