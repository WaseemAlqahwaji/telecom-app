import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/theming/theme.dart';
import 'package:telecom_project/features/core/view/screens/core_screen.dart';
import 'package:telecom_project/features/core/view/widgets/expandable_widget.dart';
import 'package:tuple/tuple.dart';

/// this screen is just a UI now, until we know how the models will be from database
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
    return CoreScreen(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
        child: Column(
          children: [
            Gap(10.0.h),
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
                  allQueries(),
                  confirmedQueries(),
                  waitiningQueries(),
                  declinedQueries(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView declinedQueries() {
    return ListView.separated(
      itemBuilder: (context, index) => ExpandableWidget.expand(
        expandableWidget: Tuple2(
          true,
          Column(
            children: [
              Gap(10.0.h),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "مرفوضة من قبل : الإدارة",
                ),
              ),
              const Text(
                "لا بوجد رصيد كاف في حسابك",
              ),
            ],
          ),
        ),
        icon: Icons.warning_amber_sharp,
        iconColor: Colors.red,
      ),
      separatorBuilder: (context, index) => Gap(8.h),
      itemCount: 5,
    );
  }

  ListView waitiningQueries() {
    return ListView.separated(
      itemBuilder: (context, index) => ExpandableWidget.regular(
        icon: Icons.timer_sharp,
        iconColor: Colors.amber,
      ),
      separatorBuilder: (context, index) => Gap(8.h),
      itemCount: 5,
    );
  }

  ListView confirmedQueries() {
    return ListView.separated(
      itemBuilder: (context, index) => ExpandableWidget.regular(
        icon: Icons.check,
        iconColor: Colors.green,
      ),
      separatorBuilder: (context, index) => Gap(8.h),
      itemCount: 5,
    );
  }

  ListView allQueries() {
    return ListView.separated(
      itemBuilder: (context, index) => ExpandableWidget.expand(
        icon: Icons.warning_amber_sharp,
        iconColor: Colors.red,
        expandableWidget: Tuple2(
          true,
          Column(
            children: [
              Gap(10.0.h),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "مرفوضة من قبل : الإدارة",
                ),
              ),
              const Text(
                "لا بوجد رصيد كاف في حسابك",
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => Gap(8.h),
      itemCount: 20,
    );
  }
}
