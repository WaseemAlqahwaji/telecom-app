import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/features/core/view/screens/core_screen.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:telecom_project/features/core/view/widgets/main_text_form_component.dart';
import 'package:telecom_project/features/core/view/widgets/scrollable_column.dart';

class ElectricScreen extends StatefulWidget {
  const ElectricScreen({super.key});

  @override
  State<ElectricScreen> createState() => _ElectricScreenState();
}

class _ElectricScreenState extends State<ElectricScreen> {
  @override
  Widget build(BuildContext context) {
    return CoreScreen(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: ScrollColumnExpandable(
          children: [
            const AppTextForm(
              title: "الرقم الخاص (المميز) :",
              hintText: "أدخل الرقم",
            ),
            Gap(24.h),
            AppTextForm(
              title: "المحافظة : ",
              hintText: "اختر المحافظة",
              dropDownList: citiesName,
              isDropDown: true,
            ),
            Gap(24.h),
            const AppTextForm(
              title: "رقم الاشتراك",
              hintText: "أدخل رقم الاشتراك",
            ),
            Gap(24.h),
            const AppTextForm(
              title: "اسم المشترك :",
              hintText: "ادخل اسم الزبون",
            ),
            Gap(24.h),
            const AppTextForm(
              title: "المبلغ : ",
              hintText: "أدخل المبلغ",
            ),
            Gap(24.h),
            const AppTextForm(
              title: "ملاحظات",
            ),
            Gap(32.h),
            AppButton(
              width: double.infinity,
              onPressd: () {},
              lable: "استعلام",
            ),
            Gap(14.h),
            AppButton(
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
