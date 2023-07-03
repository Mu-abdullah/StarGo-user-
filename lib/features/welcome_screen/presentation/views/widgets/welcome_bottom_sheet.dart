import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user/core/utils/assets.dart';
import 'package:user/core/utils/colors.dart';

import '../../../../../core/utils/texts.dart';

class WelcomeScreenBottomSheet extends StatelessWidget {
  const WelcomeScreenBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TitleTexts(text: "اهلا بيك  تحب تتواصل معانا ازاي ؟"),
          ListTile(
            title: const TitleTexts(text: "واتساب"),
            trailing: const Icon(
              Icons.whatsapp,
              color: Colors.green,
            ),
            leading: const Icon(
              Iconsax.arrow_left_1,
              color: AppColors.blackColor,
            ),
            onTap: () {
              final Uri uri =
                  Uri.parse("https://wa.me/+2${AssetDate.appWahts}");
              _launchLink(url: uri);
            },
          ),
          ListTile(
            title: const TitleTexts(text: "الاتصال"),
            trailing: const Icon(
              Icons.call,
              color: AppColors.blackColor,
            ),
            leading: const Icon(
              Iconsax.arrow_left_1,
              color: AppColors.blackColor,
            ),
            onTap: () {
              _makePhoneCall(phoneNumber: AssetDate.appCall);
            },
          ),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerRight,
            child: TitleTexts(
              text: "شوف عروضنا بإسمترار عن طريق",
              fontFamily: AssetDate.messiriFont,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            title: const TitleTexts(text: "فيسبوك"),
            trailing: const Icon(
              Icons.facebook,
              color: Colors.blue,
            ),
            leading: const Icon(
              Iconsax.arrow_left_1,
              color: AppColors.blackColor,
            ),
            onTap: () {
              final Uri uri = Uri.parse(AssetDate.appFaceBook);
              _launchLink(url: uri);
            },
          ),
          const SizedBox(height: 20),
          const SubTitleTexts(
            text: "العنوان : شارع البيطاش الرئيسي امام صيدلية صابرين",
            fontFamily: AssetDate.messiriFont,
          ),
          ListTile(
            title: const TitleTexts(text: "العنوان على الخريطة"),
            trailing: const Icon(
              Iconsax.location,
              color: AppColors.blueColor,
            ),
            leading: const Icon(
              Iconsax.arrow_left_1,
              color: AppColors.blackColor,
            ),
            onTap: () {
              final Uri uri = Uri.parse(AssetDate.appLoction);
              _launchLink(url: uri);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _makePhoneCall({required String phoneNumber}) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: "+2$phoneNumber",
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchLink({required Uri url}) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
