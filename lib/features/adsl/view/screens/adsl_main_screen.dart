import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/helpers/extensions.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/features/core/view/screens/background_screens.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:telecom_project/features/core/view/screens/scrollable_column.dart';

class AdslMainScreen extends StatefulWidget {
  const AdslMainScreen({super.key});

  @override
  State<AdslMainScreen> createState() => _AdslMainScreenState();
}

class _AdslMainScreenState extends State<AdslMainScreen> {
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
              rowTitle: "أسم الزبون :",
              hintText: "أدخل أسم الزبون",
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

  Column rowElement({
    required String rowTitle,
    String? hintText,
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
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
