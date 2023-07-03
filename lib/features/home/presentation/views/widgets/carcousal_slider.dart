import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/size.dart';
import '../../../data/model/banner_model.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: SizedBox(
        child: Column(
          children: [
            CarouselSlider(
                items: bannerImage
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: AppColors.blackColor,
                                  width: 2,
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                      e.image,
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: CustomSize().heightSize(context, .25),
                  initialPage: 0,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  scrollDirection: Axis.horizontal,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlayCurve: Curves.ease,
                  viewportFraction: 1,
                )),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

List<BannerModel> bannerImage = [
  const BannerModel(AssetDate.pastaBanner),
  const BannerModel(AssetDate.crepeBanner),
  const BannerModel(AssetDate.pizzaBanner),
];
