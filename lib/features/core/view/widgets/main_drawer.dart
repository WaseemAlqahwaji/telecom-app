import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/helpers/extensions.dart';
import 'package:telecom_project/config/routes/app_router.dart';
import 'package:telecom_project/config/routes/route_path.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/features/core/data/local/category_data.dart';
import 'package:telecom_project/features/core/view/widgets/main_divider.dart';
import 'package:tuple/tuple.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double drawerWidth = context.getScreenWidth() * .7;
    return Drawer(
      width: drawerWidth,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Gap(context.getStatusBarHeight()),
            Row(
              children: [
                IconButton(
                  icon: Image.asset(
                    width: 22.w,
                    height: 22.h,
                    "assets/images/cancel.png",
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
            Flexible(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: getDrawerCategoryList().length,
                separatorBuilder: (context, index) => Gap(16.h),
                itemBuilder: (context, index) => drawerElement(
                  context,
                  itemScreenPath: getDrawerCategoryList()[index].item1,
                  title: getDrawerCategoryList()[index].item2,
                  iconPath: getDrawerCategoryList()[index].item3,
                  drawerWidth: drawerWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Tuple3<String, String, String>> getDrawerCategoryList() {
    Tuple3<String, String, String> homeTupleData = const Tuple3(
      Routes.homeScreen,
      "الرئيسية",
      "assets/images/home.png",
    );
    List<Tuple3<String, String, String>> drawerDetails = [];
    drawerDetails.addAll(categoryData.sublist(3));
    drawerDetails.insert(0, homeTupleData);
    return drawerDetails;
  }

  Widget drawerElement(
    BuildContext context, {
    required double drawerWidth,
    required String itemScreenPath,
    required String title,
    required String iconPath,
  }) {
    return InkWell(
      onTap: () {
        if (AppRouter.currnetScreenName != itemScreenPath) {
          context.pushReplacementNamed(itemScreenPath);
        } else {
          context.pop();
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                iconPath,
                width: 40.w,
                height: 40.h,
              ),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyled.font16DarkBlue400,
                ),
              ),
            ],
          ),
          Gap(12.h),
          myDivider(width: drawerWidth),
        ],
      ),
    );
  }
}
