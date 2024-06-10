import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/config/theming/theme.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';

class ConfirmDialog extends StatelessWidget {
  final String dialogTitle;
  final String confirmTitle;
  final String cancelTitle;
  final void Function() onTapCancel;
  final void Function() onTapConfirm;
  const ConfirmDialog({
    super.key,
    required this.confirmTitle,
    required this.cancelTitle,
    required this.onTapCancel,
    required this.onTapConfirm,
    required this.dialogTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shadowColor: KTheme.mainColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              dialogTitle,
              style: TextStyled.font16Black400,
            ),
            Gap(20.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainButton(
                  onPressd: onTapConfirm,
                  lable: confirmTitle,
                  isBackGroungWhite: true,
                ),
                MainButton(
                  onPressd: onTapCancel,
                  lable: cancelTitle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
