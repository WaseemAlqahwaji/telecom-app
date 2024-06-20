import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/theming/theme.dart';

class DatePickerWidget extends StatefulWidget {
  final String dateTitle;
  final String date;
  final void Function() onTap;
  const DatePickerWidget({
    super.key,
    required this.dateTitle,
    required this.date, required this.onTap,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.dateTitle,
        ),
        Gap(10.0.w),
        InkWell(
          onTap: widget.onTap,
          child: Container(
            padding: EdgeInsets.all(10.0.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: KTheme.mainColor),
            ),
            child: Text(
              widget.date,
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
      ],
    );
  }


}
