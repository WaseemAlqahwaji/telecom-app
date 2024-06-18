import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/features/core/view/screens/core_screen.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:telecom_project/features/core/view/widgets/main_text_form_component.dart';
import 'package:telecom_project/features/core/view/widgets/scrollable_column.dart';

class HomePhoneScreen extends StatefulWidget {
  const HomePhoneScreen({super.key});

  @override
  State<HomePhoneScreen> createState() => _HomePhoneScreenState();
}

class _HomePhoneScreenState extends State<HomePhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return CoreScreen(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: ScrollColumnExpandable(
          children: [
            const MainTextFormComponent(
              title: "الرقم : ",
              hintText: "أدخل الرقم او الكود",
            ),
            Gap(24.h),
            const MainTextFormComponent(
              title: "اسم المشترك :",
              hintText: "ادخل اسم الزبون",
            ),
            Gap(24.h),
            const MainTextFormComponent(
              title: "المبلغ : ",
              hintText: "أدخل المبلغ",
            ),
            Gap(24.h),
            const MainTextFormComponent(
              title: "ملاحظات",
            ),
            Gap(32.h),
            MainButton(
              width: double.infinity,
              onPressd: () {},
              lable: "استعلام",
            ),
            Gap(14.h),
            MainButton(
              width: double.infinity,
              onPressd: () {},
              lable: "دفع",
              isBackGroungWhite: true,
            ),
          ],
        ),
      ),
    );
  }

  List<String> citiesName = [
    "اللاذقية",
    "دمشق",
    "طرطوس",
    "حماه",
    "إدلب",
    "حمص",
    "حلب",
  ];
}
