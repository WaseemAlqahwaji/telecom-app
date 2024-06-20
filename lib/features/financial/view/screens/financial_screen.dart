import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart' as intl;
import 'package:telecom_project/config/theming/theme.dart';
import 'package:telecom_project/features/core/view/widgets/expandable_widget.dart';
import 'package:telecom_project/features/core/view/widgets/main_appbar.dart';

class FinancialScreen extends StatefulWidget {
  const FinancialScreen({super.key});

  @override
  State<FinancialScreen> createState() => _FinancialScreenState();
}

class _FinancialScreenState extends State<FinancialScreen> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  String? formattedFromDate;
  String? formattedToDate;
  @override
  void initState() {
    formattedFromDate = formatDate(fromDate);
    formattedToDate = formatDate(toDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dateElement(
                    onTap: () async {
                      await myDatePicker(context).then((value) {
                        if (value != null) formattedFromDate = value;
                      });
                      setState(() {});
                    },
                    dateTitle: "من",
                    date: formattedFromDate!,
                  ),
                  dateElement(
                    onTap: () async {
                      await myDatePicker(context).then((value) {
                        if (value != null) formattedToDate = value;
                      });
                      setState(() {});
                    },
                    dateTitle: "إلى",
                    date: formattedToDate!,
                  ),
                ],
              ),
            ),
            Gap(30.h),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: ListView.separated(
                  itemBuilder: (context, index) => const ExpandableWidget(
                    icon: Icons.arrow_upward_outlined,
                    iconColor: Colors.green,
                    isExpandable: false,
                  ),
                  separatorBuilder: (context, index) => Gap(8.h),
                  itemCount: 5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> onDateTapped(
    BuildContext context, {
    required formattedDate,
  }) async {}

  Future<String?> myDatePicker(BuildContext context) async {
    var response = await showDatePicker(
      context: context,
      firstDate: DateTime(2001),
      lastDate: DateTime(2008),
    );
    if (response != null) return formatDate(response);
    return null;
  }

  String formatDate(DateTime date) {
    return intl.DateFormat.yMd().format(date);
  }

  Widget dateElement({
    required String dateTitle,
    required String date,
    required void Function()? onTap,
  }) {
    return Row(
      children: [
        Text(
          dateTitle,
        ),
        Gap(10.0.w),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(10.0.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: KTheme.mainColor),
            ),
            child: Text(
              date,
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
      ],
    );
  }
}
