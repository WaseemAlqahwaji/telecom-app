import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/features/core/view/screens/core_screen.dart';
import 'package:telecom_project/features/core/view/widgets/horizontal_cards.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:telecom_project/features/core/view/widgets/main_text_form_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telecom_project/features/mobile/views/widgets/operation_type.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreen();
}

class _MobileScreen extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return CoreScreen(
      resizeToAvoidBottomInset: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 30,
            child: HorizontalSwiper(
              imagesPaths: imagesPaths,
              isWithBorder: false,
              imageFit: BoxFit.fill,
            ),
          ),
          Gap(24.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.0.w),
            child: Column(
              children: [
                const MainTextFormComponent(
                  title: 'الرقم',
                  hintText: 'أدخل الرقم أو الكود',
                ),
                Gap(24.h),
                const OperationType(),
                Gap(24.h),
                const MainTextFormComponent(
                  title: 'الكمية',
                  hintText: 'أدخل الكمية',
                ),
                Gap(24.h),
                MainButton(
                  width: double.infinity,
                  onPressd: () {},
                  lable: 'إرسال الطلب',
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 70,
          )
        ],
      ),
    );
  }

  List<String> imagesPaths = [
    "assets/images/syriatel.png",
    "assets/images/mtn.png",
  ];
}
