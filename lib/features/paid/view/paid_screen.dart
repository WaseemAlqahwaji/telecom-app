import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/features/core/view/screens/core_screen.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:telecom_project/features/core/view/widgets/main_text_form_component.dart';
import 'package:telecom_project/features/core/view/widgets/scrollable_column.dart';

class PaidScreen extends StatefulWidget {
  const PaidScreen({super.key});

  @override
  State<PaidScreen> createState() => _PaidScreenState();
}

class _PaidScreenState extends State<PaidScreen> {
  @override
  Widget build(BuildContext context) {
    return CoreScreen(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: ScrollColumnExpandable(
          children: [
            const AppTextForm(
              title: "المبلغ : ",
              hintText: "أدخل المبلغ",
            ),
            Gap(24.h),
            const AppTextForm(
              title: "ملاحظات : ",
            ),
            Gap(32.h),
            AppButton(
              onPressd: () {},
              lable: "استعلام",
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
