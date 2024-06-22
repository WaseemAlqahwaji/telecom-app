import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/helpers/hex_color.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/config/theming/theme.dart';
import 'package:tuple/tuple.dart';

class ExpandableWidget extends StatefulWidget {
  // temprory parametrs
  final Tuple2<bool, Widget> expandableWidget;
  final IconData icon;
  final Color iconColor;
  const ExpandableWidget.expand({
    super.key,
    required this.expandableWidget,
    required this.icon,
    required this.iconColor,
  });

  ExpandableWidget.regular({
    super.key,
    required this.icon,
    required this.iconColor,
  }) : expandableWidget = Tuple2<bool, Widget>(false, Container());

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: HexColor("#F0F0F0"),
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
          expanded: widget.expandableWidget.item2,
        ),
      ),
      condition: widget.expandableWidget.item1,
      fallback: (context) => Container(
        decoration: BoxDecoration(
          color: HexColor("#F0F0F0"),
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
