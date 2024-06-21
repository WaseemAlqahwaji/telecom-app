import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/features/core/view/screens/core_screen.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:telecom_project/features/core/view/widgets/main_text_form_component.dart';
import 'package:telecom_project/features/core/view/widgets/scrollable_column.dart';

class FundsScreen extends StatefulWidget {
  const FundsScreen({super.key});

  @override
  State<FundsScreen> createState() => _FundsScreenState();
}

class _FundsScreenState extends State<FundsScreen> {
  bool isPrePaid = true;
  @override
  Widget build(BuildContext context) {
    return CoreScreen(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: ScrollColumnExpandable(
          children: [
            const MainTextFormComponent(
              title: "الرقم : ",
              hintText: "أدخل الرقم أو الكود",
            ),
            Gap(30.0.h),
            const MainTextFormComponent(
              title: "الكود : ",
              hintText: "أدخل الكود",
            ),
            Gap(50.h),
            Row(
              children: [
                const Spacer(),
                MainButton(
                  onPressd: () {
                    
                  },
                  height: 50.0.h,
                  lable: "لاحق الدفع",
                  isBackGroungWhite: isPrePaid,
                ),
                Gap(24.w),
                MainButton(
                  onPressd: () {
                    
                  },
                  height: 50.0.h,
                  lable: "مسبق الدفع",
                  isBackGroungWhite: !isPrePaid,
                ),
                const Spacer(),
              ],
            ),
            Gap(24.0.h),
            const MainTextFormComponent(
              title: "المبلغ : ",
              hintText: "أدخل الكمية",
            ),
            Gap(32.0.h),
            MainButton(
              onPressd: () {},
              height: 56.h,
              width: double.infinity,
              lable: "أرسال الطلب",
            )
          ],
        ),
      ),
    );
  }
}
