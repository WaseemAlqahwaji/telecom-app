import 'package:flutter/material.dart';
import 'package:telecom_project/features/core/view/widgets/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tuple/tuple.dart';

class SelectableRow extends StatefulWidget {
  final List<Tuple2<dynamic, String>>
      datalist; // dynamic is the itemEnumValue, String for the title of it
  final Function(dynamic value) onChange;
  const SelectableRow({
    super.key,
    required this.datalist,
    required this.onChange,
  });

  @override
  State<SelectableRow> createState() => _SelectableRowState();
}

class _SelectableRowState extends State<SelectableRow> {
  var selectedItem;
  @override
  void initState() {
    selectedItem = widget.datalist[0].item1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.datalist.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: (index == widget.datalist.length)
              ? EdgeInsets.zero
              : EdgeInsetsDirectional.only(end: 14.0.w),
          child: AppButton(
            width: 113.w,
            height: 49.h,
            fitBox: true,
            isBackGroungWhite:
                (selectedItem == widget.datalist[index].item1) ? false : true,
            lable: widget.datalist[index].item2,
            onPressd: () {
              setState(() {
                selectedItem = widget.datalist[index].item1;
                widget.onChange(selectedItem);
              });
            },
          ),
        );
      },
    );
  }
}
