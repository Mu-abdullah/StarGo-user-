import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:user/core/utils/colors.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../core/utils/texts.dart';
import '../../../data/model/cart_model/cart_model.dart';
import '../../manger/cart_cubit/cart_screen_cubit.dart';
import 'image_category_cart.dart';

class OrderListViewItem extends StatelessWidget {
  OrderListViewItem({
    super.key,
    required this.order,
  });
  final CartModel order;
  final TextEditingController note = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ClipPath(
                        clipper: BlobClipper(
                          id: '6-7-21',
                        ),
                        child: CustomCardImage(product: order))),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: TitleTexts(
                            text: order.name!,
                            fontFamily: AssetDate.messiriFont,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              order.delete();
                              BlocProvider.of<CartScreenCubit>(context)
                                  .deletItems();
                            },
                            icon: const CircleAvatar(
                              backgroundColor: AppColors.secondColor,
                              child: Icon(
                                Iconsax.minus,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SubTitleTexts(
                      text: "الوصف :- ${order.description!}",
                      fontFamily: AssetDate.messiriFont,
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        SubTitleTexts(
                          text: "السعر :- ${(order.price!).round()} جنيه",
                          fontFamily: AssetDate.messiriFont,
                        ),
                        const Spacer(),
                        SubTitleTexts(
                          text: "الكمية :- ${order.quantity}",
                          fontFamily: AssetDate.messiriFont,
                        ),
                      ],
                    ),
                    TitleTexts(
                      text: "الاجمالي :- ${(order.totalPrice!).round()} جنيه",
                      fontFamily: AssetDate.messiriFont,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            color: AppColors.primaryColor,
            thickness: CustomSize().widthSize(context, .01),
            endIndent: CustomSize().widthSize(context, .05),
            indent: CustomSize().widthSize(context, .05),
          ),
        ],
      ),
    );
  }
}
