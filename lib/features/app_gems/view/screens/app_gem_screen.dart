import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/helpers/extensions.dart';
import 'package:telecom_project/config/helpers/hex_color.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/config/theming/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telecom_project/features/core/view/widgets/main_appbar.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:telecom_project/features/core/view/widgets/main_text_form_component.dart';

class AppGemScreen extends StatefulWidget {
  const AppGemScreen({super.key});

  @override
  State<AppGemScreen> createState() => _AppGemScreenState();
}

class _AppGemScreenState extends State<AppGemScreen> {
  @override
  Widget build(BuildContext context) {
    // Set initial index to the middle of the data
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/backgroud_screens.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: mainAppbar,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Gap(24.h),
            cardHorizontalList(),
            Gap(15.h),
            formsItem(),
            Gap(24.h),
            gemsPriceList(),
            Gap(32.h),
            sendRequestButton(),
            Gap(32.h),
          ],
        ),
      ),
    );
  }

  Widget gemsPriceList() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              width: 2,
              color: KTheme.mainColor,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset("assets/images/bigo.png"),
              ),
              Container(
                decoration: BoxDecoration(
                  color: HexColor("#DFEBF0").withOpacity(.4),
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              Column(
                children: [
                  Text(
                    "BIGO LIVE",
                    style: TextStyled.font24Blue600.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) =>  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "19,000 SP",
                            style: TextStyled.font16Grey400,
                          ),
                          Text(
                            "50",
                            style: TextStyled.font16Grey400,

                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding sendRequestButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w),
      child: MainButton(
        onPressd: () {},
        lable: "إرسال الطلب",
        width: double.infinity,
        height: 56.h,
      ),
    );
  }

  Padding formsItem() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          const MainTextFormComponent(
            title: 'أدخل ال ID:',
            hintText: 'أدخل ID الحساب في اللعبة او التطبيق',
            textDirection: TextDirection.ltr,
          ),
          Gap(28.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(
                child: MainTextFormComponent(
                  title: 'عدد العملات :',
                  hintText: 'أدخل عدد العملات',
                  textDirection: TextDirection.ltr,
                ),
              ),
              Gap(10.h),
              Image.asset('assets/images/Vector.png'),
              Gap(10.h),
              const Expanded(
                child: MainTextFormComponent(
                  title: 'المبلغ :',
                  hintText: 'السعر / القيمة',
                  textDirection: TextDirection.ltr,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Flexible cardHorizontalList() {
    return Flexible(
      child: Swiper(
        loop: false,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: KTheme.mainColor, width: 2),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/images/bigo.png",
                ),
              ),
            ),
          );
        },
        itemCount: 2,
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}
