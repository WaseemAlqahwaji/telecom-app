import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/helpers/hex_color.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/features/core/view/widgets/custom_icons.dart';

class FinancialTransictionItem extends StatelessWidget {
  final int index;
  const FinancialTransictionItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor("#F0F0F0"),
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.all(10.h),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0.w,
              vertical: 10.0.h,
            ),
            child: Icon(
              index % 2 == 0 ? TelecomAppIcons.up : TelecomAppIcons.down,
              color: index % 2 == 0 ? Colors.green : Colors.red,
              size: 16.h,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(index % 2 == 0 ? "ايداع" : "سحب"),
                      Gap(5.w),
                      Text(
                        "6547239#",
                        style: TextStyled.font14grey300,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    "23000",
                    style: TextStyled.font16DarkBlue400.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                Gap(10.0.w),
                Text(
                  "2024 / 04 / 01",
                  textDirection: TextDirection.ltr,
                  style: TextStyled.font12Black400,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
