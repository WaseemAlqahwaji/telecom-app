import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/helpers/extensions.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/features/core/view/screens/background_screens.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:telecom_project/features/core/view/screens/scrollable_column.dart';
import 'package:telecom_project/features/water/view/widgets/dropdown_widget.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({super.key});

  @override
  State<WaterScreen> createState() => _WaterScreen();
}

class _WaterScreen extends State<WaterScreen> {
  @override
  Widget build(BuildContext context) {
    return CoreScreen(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: ScrollColumnExpandable(
          children: [
            Gap(context.getTopHeight()),
            rowElement(
              rowTitle: "الرقم : ",
              hintText: "أدخل الرقم او الكود",
            ),
            Gap(24.h),
            rowElement(
              rowTitle: "المحافظة : ",
              hintText: "اختر المحافظة",
              isDropDown: true,
            ),
            Gap(24.h),
            rowElement(
              rowTitle: "مزود الخدمة :",
              hintText: "اختر اسم مزود الخدمة",
            ),
            Gap(24.h),
            rowElement(
              rowTitle: ": Static IP",
              hintText: "اختياري",
            ),
            Gap(24.h),
            rowElement(
              rowTitle: "المبلغ : ",
              hintText: "أدخل المبلغ",
            ),
            Gap(24.h),
            rowElement(
              rowTitle: "ملاحظات",
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

  Column rowElement({
    required String rowTitle,
    String? hintText,
    bool? isDropDown = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 16.0.w),
          child: Text(
            rowTitle,
            style: TextStyled.font16DarkBlue700,
          ),
        ),
        Gap(8.0.h),
        ConditionalBuilder(
          condition: isDropDown!,
          fallback: (context) => TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
            ),
          ),
          builder: (context) => DropDownWidget(
            hintText: hintText!,
            items: citiesName,
          ),
        ),
      ],
    );
  }
}
