import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telecom_project/config/helpers/material_color_converter.dart';
import 'package:telecom_project/config/theming/text_style.dart';

class DropDownWidget extends StatefulWidget {
  final List<String> items;
  final String hintText;
  const DropDownWidget({
    super.key,
    required this.items,
    required this.hintText,
  });

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      menuItemStyleData: MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        customHeights: itemsHeights(widget.items.length),
      ),
      decoration: InputDecoration(
        alignLabelWithHint: false,
        hintText: widget.hintText,
      ),
      isExpanded: true,
      value: selectedItem,
      items: dropDownItems(widget.items),
      onChanged: (value) {
        setState(() {
          selectedItem = value;
        });
      },
    );
  }

  List<DropdownMenuItem<String>> dropDownItems(List<String> items) {
    final List<DropdownMenuItem<String>> menuItems = [];
    for (final String item in items) {
      menuItems.addAll([
        DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: item == selectedItem
                ? TextStyled.font16DarkBlue400
                : TextStyled.font16Grey400
                    .copyWith(color: Colors.grey.withOpacity(.8)),
          ),
        ),
        if (item != items.last)
          DropdownMenuItem<String>(
            enabled: false,
            child: Container(
              color: Colors.grey.withOpacity(.7),
              height: 1,
              width: double.infinity,
            ),
          ),
      ]);
    }
    return menuItems;
  }

  List<double> itemsHeights(int arrayLength) {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (arrayLength * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      if (i.isOdd) {
        itemsHeights.add(2);
      }
    }
    return itemsHeights;
  }
}
