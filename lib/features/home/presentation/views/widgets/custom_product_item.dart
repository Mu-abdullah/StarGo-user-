import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/constanent.dart';
import '../../../../../core/utils/size.dart';
import '../../../../../core/utils/texts.dart';
import '../../../../../core/widgets/category_image.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.blueColor.withOpacity(.3),
            border: Border.all(
              width: 1,
              color: AppColors.blackColor,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              SizedBox(
                width: CustomSize().widthSize(context, .4),
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: BlobClipper(
                        id: Constant.homeScreenItemBlobId,
                      ),
                      child: CustomCategoryImage(product: product),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: TitleTexts(
                        text: "${product.name}",
                        fontFamily: AssetDate.messiriFont,
                        fontSize: 28,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SubTitleTexts(
                        text: "${product.description}",
                        maxLines: 1,
                        fontFamily: AssetDate.messiriFont,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SubTitleTexts(
                            text: "${product.priceS.toString()} جنيه",
                            fontFamily: AssetDate.messiriFont,
                            maxLines: 3,
                            subTitleColor: AppColors.blackColor,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: SubTitleTexts(
                            text: "${(product.priceM.toString())} جنيه",
                            fontFamily: AssetDate.messiriFont,
                            maxLines: 3,
                            subTitleColor: AppColors.blackColor,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: SubTitleTexts(
                            text: "${product.priceL.toString()} جنيه",
                            fontFamily: AssetDate.messiriFont,
                            maxLines: 3,
                            subTitleColor: AppColors.blackColor,
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
    );
  }
}
