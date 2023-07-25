import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:user/core/utils/app_routs.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../core/utils/texts.dart';
import '../../../../../core/widgets/category_image.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../cart/data/model/cart_model/cart_model.dart';
import '../../../data/model/products/product_model.dart';
import '../../manger/order_cubit/order_cubit.dart';
import '../../manger/order_cubit/order_state.dart';

class ProductDetailsScreenView extends StatefulWidget {
  const ProductDetailsScreenView({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<ProductDetailsScreenView> createState() =>
      _ProductDetailsScreenViewState();
}

class _ProductDetailsScreenViewState extends State<ProductDetailsScreenView> {
  double? sizePrice;
  String? size;
  int quatity = 1;
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(),
      child: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {
          if (state is SuccessAddOrder) {
            AppRouter.router.refresh();

            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          OrderCubit orderCubit = OrderCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: CustomSize().heightSize(context, .25),
                        child: ClipPath(
                          clipper: BlobClipper(
                            id: '20-7-784150',
                          ),
                          child: CustomCategoryImage(product: widget.product),
                        ),
                      ),
                    ),
                    Divider(
                      color: AppColors.blackColor,
                      thickness: CustomSize().widthSize(context, .01),
                      indent: CustomSize().widthSize(context, .35),
                    ),
                    TitleTexts(
                      text: widget.product.name!,
                      fontFamily: AssetDate.messiriFont,
                      fontSize: 48,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SubTitleTexts(
                      text: widget.product.description!,
                      fontSize: 32,
                      fontFamily: AssetDate.messiriFont,
                      maxLines: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: AppColors.primaryColor,
                      thickness: CustomSize().widthSize(context, .01),
                      endIndent: CustomSize().widthSize(context, .35),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: widget.product.priceM == 0 ||
                              widget.product.priceL == 0
                          ? Container(
                              width: CustomSize().widthSize(context, 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.secondColor.withOpacity(.2)),
                              child: const SubTitleTexts(
                                  text: "يرجى اختيار الحجم المتاح حاليا"),
                            )
                          : null,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ToggleButtons(
                          constraints: BoxConstraints(
                            minHeight: CustomSize().heightSize(context, .06),
                            minWidth: CustomSize().widthSize(context, .26),
                          ),
                          isSelected: isSelected,
                          fillColor: AppColors.primaryColor,
                          renderBorder: true,
                          borderColor: Colors.black,
                          borderWidth: 1,
                          borderRadius: BorderRadius.circular(25),
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SubTitleTexts(
                                  text: "Small",
                                  fontFamily: AssetDate.berlinFont,
                                  maxLines: 3,
                                  subTitleColor: AppColors.blackColor,
                                ),
                                SubTitleTexts(
                                  text: "${widget.product.priceS} جنيه",
                                  fontFamily: AssetDate.messiriFont,
                                  maxLines: 3,
                                  fontWeight: FontWeight.bold,
                                  subTitleColor: AppColors.blackColor,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SubTitleTexts(
                                  text: "Medium",
                                  fontFamily: AssetDate.berlinFont,
                                  maxLines: 3,
                                  subTitleColor: AppColors.blackColor,
                                ),
                                SubTitleTexts(
                                  text: "${widget.product.priceM} جنيه",
                                  fontFamily: AssetDate.messiriFont,
                                  maxLines: 3,
                                  fontWeight: FontWeight.bold,
                                  subTitleColor: AppColors.blackColor,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SubTitleTexts(
                                  text: "Larg",
                                  fontFamily: AssetDate.berlinFont,
                                  maxLines: 3,
                                  subTitleColor: AppColors.blackColor,
                                ),
                                SubTitleTexts(
                                  text: "${widget.product.priceL} جنيه",
                                  fontFamily: AssetDate.messiriFont,
                                  maxLines: 3,
                                  fontWeight: FontWeight.bold,
                                  subTitleColor: AppColors.blackColor,
                                ),
                              ],
                            ),
                          ],
                          onPressed: (int newIndex) {
                            setState(() {
                              for (int index = 0;
                                  index < isSelected.length;
                                  index++) {
                                if (index == newIndex) {
                                  isSelected[index] = true;
                                } else {
                                  isSelected[index] = false;
                                }
                                if (newIndex == 0) {
                                  sizePrice = widget.product.priceS;
                                  size = "صغير";
                                } else if (newIndex == 1) {
                                  sizePrice = widget.product.priceM;
                                  size = "وسط";
                                } else {
                                  sizePrice = widget.product.priceL;
                                  size = "كبير";
                                }
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quatity++;
                                    if (quatity > 10) {
                                      quatity = 10;
                                    }
                                  });
                                },
                                icon: const Icon(Iconsax.add_circle),
                              ),
                              SubTitleTexts(
                                text: "$quatity",
                                fontSize: 21,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quatity--;
                                    if (quatity < 1) {
                                      quatity = 1;
                                    }
                                  });
                                },
                                icon: const Icon(Iconsax.minus_cirlce),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CustomButton(
                            arabic: false,
                            wantIcon: false,
                            fontsize: 18,
                            loadingState:
                                state is LoadingAddOrder ? true : false,
                            buttonName: "أضف إلي العربة",
                            onPress: () {
                              final cart = CartModel(
                                name: widget.product.name!,
                                description: widget.product.description!,
                                category: widget.product.category!,
                                quantity: quatity,
                                size: size ?? "صغير",
                                price: sizePrice ?? widget.product.priceS,
                                id: widget.product.id,
                              );
                              orderCubit.addOrder(cart);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
