import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/helpers/extensions.dart';
import 'package:telecom_project/config/routes/route_path.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/config/theming/theme.dart';
import 'package:telecom_project/features/core/data/local/category_data.dart';
import 'package:telecom_project/features/core/view/screens/core_screen.dart';
import 'package:telecom_project/features/core/view/widgets/confirm_dialog.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:telecom_project/features/core/view/widgets/scrollable_column.dart';
import 'package:telecom_project/features/core/view/widgets/main_divider.dart';
import 'package:tuple/tuple.dart';
import '../widgets/progress_indicator.dart';

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
            const MyProgressIndicator(
              currentIncome: 648972,
              maxSalary: 1000000,
            ),
            const Spacer(),
            rowComponent(
              isBlue: true,
              categoryDetails: categoryData.sublist(0, 3),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: myDivider(),
            ),
            rowComponent(
              categoryDetails: categoryData.sublist(3, 6),
            ),
            Gap(8.h),
            rowComponent(
              categoryDetails: categoryData.sublist(6, 9),
            ),
            Gap(8.h),
            rowComponent(
              categoryDetails: categoryData.sublist(9, 11),
            ),
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
    required List<Tuple3<String, String, String>> categoryDetails,
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
                context.pushNamed(
                    categoryDetails[index].item1); // item1 is the screen path
              },
              child: categoryContainer(
                title: categoryDetails[index].item2,
                iconPath: categoryDetails[index].item3, // item3 is the iconPath
                isBlue: isBlue,
                context: context,
              ),
            ),
          );
        }
        return InkWell(
          onTap: () {
            context.pushNamed(categoryDetails[index].item1);
          },
          child: categoryContainer(
            title: categoryDetails[index].item2,
            iconPath: categoryDetails[index].item3,
            isBlue: isBlue,
            context: context,
          ),
        );
      }),
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

