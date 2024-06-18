import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/config/theming/theme.dart';
import 'package:telecom_project/features/core/view/widgets/main_appbar.dart';

class OprationScreen extends StatefulWidget {
  const OprationScreen({super.key});

  @override
  State<OprationScreen> createState() => _OprationScreenState();
}

class _OprationScreenState extends State<OprationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppbar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "بحث ...",
                prefixIcon: Icon(
                  Icons.search,
                  color: KTheme.mainColor,
                ),
              ),
            ),
            Gap(8.h),
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'الكل'),
                Tab(text: 'المقبولة'),
                Tab(text: 'المنتظرة'),
                Tab(text: 'المرفوضة'),
              ],
            ),
            Gap(15.0.h),
            Flexible(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.separated(
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.2),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.all(10.h),
                      child: ExpandablePanel(
                        theme: ExpandableThemeData(
                          iconColor: KTheme.mainColor,
                          tapBodyToCollapse: true,
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                        ),
                        header: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LayoutBuilder(
                              builder: (context,cons) {
                                print(cons.maxWidth);
                                return Image.asset(
                                  "assets/images/adsl.png",
                                  height: 20,
                                  width: 20,
                                );
                              }
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Text("ADSL"),
                                    Gap(5.w),
                                    Image.asset(
                                      height: 21.h,
                                      width: 18.w,
                                      "assets/images/warning.png",
                                    )
                                  ],
                                ),
                                Text(
                                  "6547239#",
                                  style: TextStyled.font14grey300,
                                ),
                              ],
                            ),
                            Text(
                              "23000",
                              style: TextStyled.font16DarkBlue400.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "2024 / 04 / 01",
                              textDirection: TextDirection.ltr,
                              style: TextStyled.font12Black400,
                            ),
                          ],
                        ),
                        collapsed: const SizedBox.shrink(),
                        expanded: Text(
                          "Expandable should not be confused with ExpansionPanel. ExpansionPanel, which is a part of Flutter material library, is designed to work only within ExpansionPanelList and cannot be used for making other widgets, for example, expandable Card widgets.",
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => Gap(8.h),
                    itemCount: 5,
                  ),

                  // second tab bar view widget
                  Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Place Bid',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // second tab bar view widget
                  Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
