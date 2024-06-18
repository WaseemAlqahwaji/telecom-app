import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/config/theming/theme.dart';

class ExpandableWidget extends StatefulWidget {
  // temprory parametrs
  final bool isExpandable;
  final IconData icon;
  final Color iconColor;
  const ExpandableWidget({
    super.key,
    this.isExpandable = true,
    required this.icon,
    required this.iconColor,
  });

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.all(10.h),
        child: ExpandablePanel(
          theme: ExpandableThemeData(
            iconColor: KTheme.mainColor,
            tapBodyToCollapse: true,
            headerAlignment: ExpandablePanelHeaderAlignment.center,
          ),
          header: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LayoutBuilder(builder: (context, cons) {
                // # TODO overflow when there is long string in the row
                return Image.asset(
                  "assets/images/adsl.png",
                  height: 20.h,
                  width: 20.w,
                );
              }),
              Column(
                children: [
                  Row(
                    children: [
                      const Text("ADSL"),
                      Gap(5.w),
                      // Image.asset(
                      //   height: 21.h,
                      //   width: 18.w,
                      //   "assets/images/warning.png",
                      // ),
                      Icon(
                        widget.icon,
                        color: widget.iconColor,
                      ),
                    ],
                  ),
                  Text(
                    "6547239#",
                    style: TextStyled.font14grey300,
                  ),
                ],
              ),
              Text(
                "23000",
                style: TextStyled.font16DarkBlue400.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                "2024 / 04 / 01",
                textDirection: TextDirection.ltr,
                style: TextStyled.font12Black400,
              ),
            ],
          ),
          collapsed: const SizedBox.shrink(),
          expanded: const Column(
            textDirection: TextDirection.rtl,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "مرفوضة من قبل : الإدارة",
                ),
              ),
              Text(
                "لا بوجد رصيد كاف في حسابك",
              ),
            ],
          ),
        ),
      ),
      condition: widget.isExpandable,
      fallback: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.all(10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LayoutBuilder(builder: (context, cons) {
              // # TODO overflow when there is long string in the row
              return Image.asset(
                "assets/images/adsl.png",
                height: 20.h,
                width: 20.w,
              );
            }),
            Column(
              children: [
                Row(
                  children: [
                    const Text("ADSL"),
                    Gap(5.w),
                    Icon(
                      widget.icon,
                      color: widget.iconColor,
                    )
                  ],
                ),
                Text(
                  "6547239#",
                  style: TextStyled.font14grey300,
                ),
              ],
            ),
            Text(
              "23000",
              style: TextStyled.font16DarkBlue400.copyWith(
                color: Colors.black,
              ),
            ),
            Text(
              "2024 / 04 / 01",
              textDirection: TextDirection.ltr,
              style: TextStyled.font12Black400,
            ),
          ],
        ),
      ),
    );
  }
}
