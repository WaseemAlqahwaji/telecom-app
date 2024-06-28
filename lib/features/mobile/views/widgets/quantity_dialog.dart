import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telecom_project/config/helpers/extensions.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:tuple/tuple.dart';

class QuantityDialog extends StatefulWidget {
  final List<Tuple2<int, int>> dialogData;
  const QuantityDialog({
    super.key,
    required this.dialogData,
  });

  @override
  State<QuantityDialog> createState() => _QuantityDialogState();
}

class _QuantityDialogState extends State<QuantityDialog> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: SizedBox(
          height: context.getScreenHeight() * 0.7,
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: widget.dialogData.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      context.pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(20.0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.dialogData[index].item1.toString(),
                            style: TextStyled.font16Black400,
                          ),
                          Text(
                            "(${widget.dialogData[index].item2} S.P)",
                            textDirection: TextDirection.ltr,
                            style: TextStyled.font16Black400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
