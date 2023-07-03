import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:user/core/utils/app_routs.dart';

import '../../../../../core/helper/cash_helper_data.dart';
import '../../../../../core/helper/shared_preferences.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/texts.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_form_field.dart';

class UserDetailsBottomSheetModel extends StatefulWidget {
  const UserDetailsBottomSheetModel({
    super.key,
  });

  @override
  State<UserDetailsBottomSheetModel> createState() =>
      _UserDetailsBottomSheetModelState();
}

class _UserDetailsBottomSheetModelState
    extends State<UserDetailsBottomSheetModel> {
  final TextEditingController name = TextEditingController();

  final TextEditingController phone = TextEditingController();

  final TextEditingController address = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? uName;
  String? uPhone;
  String? uAddress;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleTexts(
                  text: "البيانات",
                  fontFamily: AssetDate.messiriFont,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: "الاسم",
                  label: "الاسم",
                  fontFamily: AssetDate.messiriFont,
                  prefix: const Icon(Iconsax.personalcard),
                  isPassword: false,
                  controller: name,
                  type: TextInputType.name,
                  maxLines: 1,
                  validate: (value) {
                    if (value.isEmpty) {
                      return "الاسم مطلوب";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    uName = value!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: "رقم الهاتف",
                  label: "رقم الهاتف",
                  fontFamily: AssetDate.messiriFont,
                  prefix: const Icon(Iconsax.call),
                  isPassword: false,
                  controller: phone,
                  type: TextInputType.number,
                  maxLines: 1,
                  validate: (value) {
                    if (value.isEmpty) {
                      return "الهاتف مطلوب";
                    }
                    if (double.tryParse(value) == null) {
                      return "يجب ان يكون رقم";
                    }
                    if (value.length < 11 || value.length > 11) {
                      return "يرجاء كتابة الرقم بصورة صحيحة";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    uPhone = value!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: "العنوان",
                  label: "العنوان",
                  fontFamily: AssetDate.messiriFont,
                  prefix: const Icon(Iconsax.location),
                  isPassword: false,
                  controller: address,
                  type: TextInputType.text,
                  maxLines: 1,
                  validate: (value) {
                    if (value.isEmpty) {
                      return "العنوان مطلوب";
                    }

                    return null;
                  },
                  onSaved: (value) {
                    uAddress = value!;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(arabic: false,
                  wantIcon: false,
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      CacheHelper.saveData(
                          key: CashHelperData.cashHelperNameKey,
                          value: uName ?? name.text);
                      CacheHelper.saveData(
                          key: CashHelperData.cashHelperPhoneKey,
                          value: uPhone ?? phone.text);
                      CacheHelper.saveData(
                          key: CashHelperData.cashHelperAdressKey,
                          value: uAddress ?? address.text);
                      AppRouter.router.refresh();
                      Navigator.pop(context);
                    }
                  },
                  buttonName: "حفظ البيانات",
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
