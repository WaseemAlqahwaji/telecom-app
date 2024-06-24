import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/helpers/hex_color.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/config/theming/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telecom_project/features/core/view/widgets/horizontal_cards.dart';
import 'package:telecom_project/features/core/view/widgets/main_appbar.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:telecom_project/features/core/view/widgets/main_text_form_component.dart';
import 'package:tuple/tuple.dart';

class AppGemScreen extends StatefulWidget {
  const AppGemScreen({super.key});

  @override
  State<AppGemScreen> createState() => _AppGemScreenState();
}

class _AppGemScreenState extends State<AppGemScreen> {
  String listCurrentTitle = "BIGO";
  int selectedIndex = 0;
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
            _cardHorizontalList(),
            Gap(15.h),
            _formsItem(),
            Gap(24.h),
            gemsPriceList(),
            Gap(32.h),
            _sendRequestButton(),
            Gap(32.h),
          ],
        ),
      ),
    );
  }

  Widget gemsPriceList() {
    return Expanded(
      flex: 70,
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
              Container(
                decoration: BoxDecoration(
                  color: HexColor("#DFEBF0").withOpacity(.4),
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              Column(
                children: [
                  Text(
                    listCurrentTitle,
                    style: TextStyled.font24Blue600.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Gap(10.0.h),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: ListView.separated(
                        itemCount: 10,
                        separatorBuilder: (context, index) => Gap(8.h),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(5.h),
                            decoration: BoxDecoration(
                              color:selectedIndex == index ? KTheme.mainColor : null,
                              borderRadius: BorderRadius.circular(10.0.r),
                            ), 
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "19,000 SP",
                                  style: TextStyled.font16Grey400.copyWith(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : HexColor("#444444"),
                                  ),
                                  textDirection: TextDirection.ltr,
                                ),
                                Text(
                                  "50",
                                  style: TextStyled.font16Grey400.copyWith(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : HexColor("#444444"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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

  Widget _cardHorizontalList() {
    List<String> imagesPaths = [];
    List<String> titlePaths = [];
    appGemsData.values.toList().forEach((value) {
      imagesPaths.add(value["image"]);
    });
    titlePaths.addAll(appGemsData.keys);
    return Flexible(
      flex: 30,
      child: HorizontalSwiper(
        imagesPaths: imagesPaths,
        onChangeIndex: (index) {
          // if there is an image in the list
          setState(() {
            listCurrentTitle = titlePaths[index];
          });
        },
      ),
    );
  }

  Padding _formsItem() {
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

  Padding _sendRequestButton() {
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

  Map<String, dynamic> appGemsData = {
    "BIGO LIVE": const {
      "image": "assets/images/bigo.png",
      "data": [
        Tuple2("50", "1900"),
        Tuple2("100", "35000"),
        Tuple2("252", "89000"),
        Tuple2("504", "170000"),
        Tuple2("1009", "340000"),
        Tuple2("2018", "560000"),
        Tuple2("2522", "660000"),
      ]
    },
    "FREE FIRE": const {
      "image": "assets/images/freefire.png",
      "data": [
        Tuple2("100", "20000"),
        Tuple2("210", "35000"),
        Tuple2("310", "53000"),
        Tuple2("530", "85000"),
      ],
    },
    "LivU": const {
      "image": "assets/images/livu.png",
      "data": [
        Tuple2("300", "36000"),
        Tuple2("650", "58000"),
        Tuple2("1200", "105000"),
        Tuple2("2000", "190000"),
      ],
    }
  };
}
