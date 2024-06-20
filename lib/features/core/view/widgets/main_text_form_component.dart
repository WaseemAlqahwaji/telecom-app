import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/features/core/view/widgets/dropdown_widget.dart';

class MainTextFormComponent extends StatefulWidget {
  final String title;
  final String? hintText;
  final bool? isDropDown;
  final List<String>? dropDownList;
  final TextDirection? textDirection;
  const MainTextFormComponent({
    super.key,
    required this.title,
    this.hintText,
    this.isDropDown = false,
    this.dropDownList,
    this.textDirection,
  });

  @override
  State<MainTextFormComponent> createState() => _MainTextFormComponentState();
}

class _MainTextFormComponentState extends State<MainTextFormComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 16.0.w),
          child: Text(
            widget.title,
            style: TextStyled.font16DarkBlue700,
          ),
        ),
        Gap(8.0.h),
        ConditionalBuilder(
          condition: widget.isDropDown!,
          fallback: (context) => TextFormField(
            decoration: InputDecoration(
              hintText: widget.hintText,
            ),
            textDirection: widget.textDirection,
          ),
          builder: (context) => TextFormDropDownWidget(
            hintText: widget.hintText!,
            items: widget.dropDownList!,
          ),
        ),
      ],
    );
  }
}
