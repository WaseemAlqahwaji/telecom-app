import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telecom_project/config/theming/theme.dart';

class HorizontalSwiper extends StatefulWidget {
  final void Function(int index)? onChangeIndex;
  final List<String> imagesPaths;
  final bool isWithBorder;
  final BoxFit imageFit;
  const HorizontalSwiper({
    super.key,
    this.onChangeIndex,
    required this.imagesPaths,
    this.isWithBorder = true,
    this.imageFit = BoxFit.contain,
  });

  @override
  State<HorizontalSwiper> createState() => _HorizontalSwiperState();
}

class _HorizontalSwiperState extends State<HorizontalSwiper> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      loop: false,
      onIndexChanged: widget.onChangeIndex,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            border: widget.isWithBorder
                ? Border.all(color: KTheme.mainColor, width: 2)
                : null,
            image: DecorationImage(
              fit: widget.imageFit,
              image: AssetImage(
                widget.imagesPaths[index],
              ),
            ),
          ),
        );
      },
      itemCount: widget.imagesPaths.length,
      viewportFraction: 0.7,
      scale: 0.8,
    );
  }
}
