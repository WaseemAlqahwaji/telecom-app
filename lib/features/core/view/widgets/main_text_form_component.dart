import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/features/core/view/widgets/dropdown_widget.dart';

class AppTextForm extends StatefulWidget {
  final String title;
  final String? hintText;
  final bool? isDropDown;
  final List<String>? dropDownList;
  final TextDirection? textDirection;
  final void Function()? onTap;
  final bool readOnly;
  const AppTextForm({
    super.key,
    required this.title,
    this.hintText,
    this.isDropDown = false,
    this.dropDownList,
    this.textDirection,
    this.onTap,
    this.readOnly = false,
  });

  @override
  State<AppTextForm> createState() => _AppTextFormState();
}

class _AppTextFormState extends State<AppTextForm> {
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
            onTap: widget.onTap,
            readOnly: widget.readOnly,
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
