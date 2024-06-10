import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pair/pair.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:telecom_project/config/helpers/extensions.dart';
import 'package:telecom_project/config/helpers/hex_color.dart';
import 'package:telecom_project/config/routes/route_path.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/config/theming/theme.dart';
import 'package:telecom_project/features/core/view/screens/background_screens.dart';
import 'package:telecom_project/features/core/view/widgets/confirm_dialog.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:telecom_project/features/core/view/screens/scrollable_column.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CoreScreen(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.0.w),
        child: ScrollColumnExpandable(
          children: [
            Gap(context.getTopHeight()),
            // TODO : Build Circal progress indicator
            const Spacer(),
            rowComponent(isBlue: true, categoryDetails: firstRowDetials),
            myDivider(),
            rowComponent(categoryDetails: secondRowDetials),
            Gap(8.h),
            rowComponent(categoryDetails: thirdRowDetials),
            Gap(8.h),
            rowComponent(categoryDetails: fourthRowDetials),
            const Spacer(),
            MainButton(
              height: 56.h,
              width: double.infinity,
              onPressd: () {
                showDialog(
                  context: context,
                  builder: (context) => logoutDialog(),
                );
              },
              lable: "تسجيل خروج",
            ),
            Gap(43.h),
          ],
        ),
      ),
    );
  }

  Widget logoutDialog() {
    return ConfirmDialog(
      cancelTitle: "لأ",
      confirmTitle: "نعم",
      dialogTitle: "هل تريد تسجيل الخروج ؟",
      onTapCancel: () => Navigator.pop(context),
      onTapConfirm: () {
        context.pushReplacementNamed(Routes.loginScreen);
      },
    );
  }

  Row rowComponent({
    bool isBlue = false,
    required List<Pair<String, Pair<String, String>>> categoryDetails,
    double smallGap = 0,
  }) {
    bool temp = false;
    return Row(
      mainAxisAlignment: categoryDetails.length == 3
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.center,
      children: List.generate(categoryDetails.length, (index) {
        if (categoryDetails.length < 3 && !temp) {
          temp = true;
          return Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: InkWell(
              onTap: () {
                context.pushNamed(categoryDetails[index].key);
              },
              child: categoryContainer(
                iconPath: categoryDetails[index].value.value,
                title: categoryDetails[index].value.key,
                isBlue: isBlue,
                context: context,
              ),
            ),
          );
        }
        return InkWell(
          onTap: () {
            context.pushNamed(categoryDetails[index].key);
          },
          child: categoryContainer(
            iconPath: categoryDetails[index].value.value,
            title: categoryDetails[index].value.key,
            isBlue: isBlue,
            context: context,
          ),
        );
      }),
    );
  }

  // # TODO : fix this circular with another one 
  SimpleCircularProgressBar circalarProgressBar() {
    return SimpleCircularProgressBar(
      animationDuration: 2,
      backColor: HexColor("#52B7DC").withOpacity(.7),
      backStrokeWidth: 12,
      fullProgressColor: KTheme.mainColor,
      mergeMode: true,
      progressColors: [
        KTheme.mainColor,
        KTheme.secondColor,
        KTheme.secondColor,
      ],
      onGetText: (double value) {
        return Text('${value.toInt()}%');
      },
    );
  }
}

Widget categoryContainer({
  required String iconPath,
  required String title,
  required bool isBlue,
  required BuildContext context,
}) {
  return Container(
    height: 120.h,
    width: 120.w,
    decoration: BoxDecoration(
      color: isBlue ? KTheme.mainColor : Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        width: 1.5,
        color: KTheme.mainColor,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40.0.h,
          width: 40.0.w,
          child: Image.asset(iconPath),
        ),
        Gap(5.0.h),
        FittedBox(
          child: Text(
            title,
            style: isBlue
                ? TextStyled.font16DarkBlue400.copyWith(color: Colors.white)
                : TextStyled.font16DarkBlue400,
          ),
        ),
      ],
    ),
  );
}

List<Pair<String, Pair<String, String>>> firstRowDetials = const [
  Pair(
    Routes.adslScreen,
    Pair("الاستعلامات", "assets/images/question_mark.png"),
  ),
  Pair(
    Routes.adslScreen,
    Pair("بياني المالي", "assets/images/istbian.png"),
  ),
  Pair(
    Routes.adslScreen,
    Pair("العمليات", "assets/images/person.png"),
  ),
];

List<Pair<String, Pair<String, String>>> secondRowDetials = const [
  Pair(
    Routes.adslScreen,
    Pair("ADSL", "assets/images/adsl.png"),
  ),
  Pair(
    Routes.adslScreen,
    Pair("أرضي", "assets/images/phone.png"),
  ),
  Pair(
    Routes.adslScreen,
    Pair("موبايل", "assets/images/mobile.png"),
  ),
];

List<Pair<String, Pair<String, String>>> thirdRowDetials = const [
  Pair(
    Routes.waterScreen,
    Pair("مياه", "assets/images/water.png"),
  ),
  Pair(
    Routes.adslScreen,
    Pair("كازية", "assets/images/bag.png"),
  ),
  Pair(
    Routes.adslScreen,
    Pair("كهرباء", "assets/images/electric.png"),
  ),
];

List<Pair<String, Pair<String, String>>> fourthRowDetials = const [
  Pair(
    Routes.adslScreen,
    Pair("دفعة", "assets/images/cash.png"),
  ),
  Pair(
    Routes.adslScreen,
    Pair("شحن تطبيقات", "assets/images/gamejoy.png"),
  ),
];

List<String> titleCategory = [
  "الاستعلامات",
  "بياني المالي",
  "العمليات",
  "ADSL",
  "أرضي",
  "موبايل",
  "مياه",
  "كازية",
  "كهرباء",
  "دفعة",
  "شحن تطبيقات",
];

Widget myDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Container(
      color: HexColor("#CDCDCD"),
      height: 1,
      width: double.infinity,
    ),
  );
}
