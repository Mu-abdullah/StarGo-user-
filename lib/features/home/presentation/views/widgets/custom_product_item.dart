import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:user/core/widgets/category_image.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/constanent.dart';
import '../../../../../core/utils/texts.dart';
import '../../../data/model/products/product_model.dart';
import 'bottom_sheet_view_product_details.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showMaterialModalBottomSheet(
              context: context,
              expand: false,
              enableDrag: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              builder: ((context) {
                return ProductDetailsScreenView(
                  product: product,
                );
              }));
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.primaryColor.withOpacity(.1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipPath(
                      clipper: BlobClipper(
                        id: Constant.homeScreenItemBlobId,
                      ),
                      child: CustomCategoryImage(product: product),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTexts(text: product.name!),
                        const SizedBox(
                          height: 5,
                        ),
                        SubTitleTexts(text: product.description!, maxLines: 1),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.zero,
                              child: product.priceS == 0
                                  ? null
                                  : TitleTexts(
                                      text: "${product.priceS.round()} جنيه",
                                      fontFamily: AssetDate.messiriFont,
                                      maxLines: 3,
                                      titleColor: AppColors.blackColor,
                                    ),
                            ),
                            Padding(
                              padding: EdgeInsets.zero,
                              child: product.priceM == 0
                                  ? null
                                  : TitleTexts(
                                      text: "${(product.priceM.round())} جنيه",
                                      fontFamily: AssetDate.messiriFont,
                                      maxLines: 3,
                                      titleColor: AppColors.blackColor,
                                    ),
                            ),
                            Padding(
                              padding: EdgeInsets.zero,
                              child: product.priceL == 0
                                  ? null
                                  : TitleTexts(
                                      text: "${(product.priceL).round()} جنيه",
                                      fontFamily: AssetDate.messiriFont,
                                      maxLines: 3,
                                      titleColor: AppColors.blackColor,
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
