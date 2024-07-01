import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:telecom_project/config/theming/theme.dart';

class AppButton extends StatelessWidget {
  final void Function() onPressd;
  final String lable;
  final double? width;
  final double? height;
  final bool? isBackGroungWhite;
  final bool fitBox;
  const AppButton({
    super.key,
    required this.onPressd,
    this.width,
    required this.lable,
    this.fitBox = false,
    this.isBackGroungWhite = false,
    this.height,
  });

  @override
  Widget build(Object context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.grey.withOpacity(.1),
          surfaceTintColor: Colors.white,
          backgroundColor:
              isBackGroungWhite == true ? Colors.white : KTheme.mainColor,
          shape: RoundedRectangleBorder(
            side: isBackGroungWhite == true
                ? BorderSide(color: KTheme.mainColor, width: 1.0)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressd,
        child: ConditionalBuilder(
          condition: fitBox,
          fallback: (context) => Text(
            lable,
            style: TextStyle(
              color:isBackGroungWhite == true ? KTheme.mainColor : Colors.white,
            ),
          ),
          builder: (context) {
            return FittedBox(
              child: Text(
                lable,
                style: TextStyle(
                  color: isBackGroungWhite == true
                      ? KTheme.mainColor
                      : Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
