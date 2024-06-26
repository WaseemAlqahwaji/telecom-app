import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/config/theming/theme.dart';
import 'package:tuple/tuple.dart';

class RadisDialog extends StatefulWidget {
  final List<Tuple2<int, int>> dialogData;
  const RadisDialog({
    super.key,
    required this.dialogData,
  });

  @override
  State<RadisDialog> createState() => _RadisDialogState();
}

class _RadisDialogState extends State<RadisDialog> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0.h),
              child: Text(
                "أختر الكمية : ",
                style: TextStyled.font20DarkBlue700,
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: widget.dialogData.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(20.0.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0.r),
                      color: selectedIndex == index
                          ? KTheme.mainColor
                          : Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget.dialogData[index].item1.toString(),
                          style: selectedIndex == index
                              ? const TextStyle(
                                  color: Colors.white,
                                )
                              : null,
                        ),
                        Text(
                          "(${widget.dialogData[index].item2} S.P)",
                          textDirection: TextDirection.ltr,
                          style: selectedIndex == index
                              ? const TextStyle(
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.h),
              child: Row(
                children: [
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
