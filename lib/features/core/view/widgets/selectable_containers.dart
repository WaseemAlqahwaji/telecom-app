import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/helpers/extensions.dart';
import 'package:telecom_project/config/theming/theme.dart';
import 'package:telecom_project/features/core/domain/enums/mobile_networks.dart';
import 'package:tuple/tuple.dart';

class SelectableContainers extends StatefulWidget {
  final List<Tuple2<String, MobileNetworks>>
      itemsData; // first String is imagePath, second is the value of the item;
  final double screenHorizontalPadding;
  const SelectableContainers({
    super.key,
    required this.itemsData,
    required this.screenHorizontalPadding,
  });

  @override
  State<SelectableContainers> createState() => _SelectableContainersState();
}

class _SelectableContainersState extends State<SelectableContainers> {
  double itemsGap = 10.0.w;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => Gap(itemsGap),
      itemCount: widget.itemsData.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            width: getItemWidth(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26.r),
              border: Border.all(
                color: KTheme.mainColor,
                width: 1,
              ),
              image: DecorationImage(
                opacity: index == selectedIndex ? 1.0 : 0.4,
                image: AssetImage(
                  widget.itemsData[index].item1,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  double getItemWidth() {
    return (context.getScreenWidth() -
            (widget.screenHorizontalPadding * 2) -
            (itemsGap * (widget.itemsData.length - 1))) /
        widget.itemsData.length;
  }
}
