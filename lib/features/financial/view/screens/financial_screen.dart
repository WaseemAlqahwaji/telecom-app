import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/helpers/date_format.dart';
import 'package:telecom_project/features/core/view/widgets/date_element.dart';
import 'package:telecom_project/features/core/view/widgets/date_picker.dart';
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
                  DatePickerWidget(
                    dateTitle: "من",
                    date: formattedFromDate!,
                    onTap: () async {
                      String? response = await myDatePicker(context);
                      if (response != null) {
                        formattedFromDate = response;
                        setState(() {});
                      }
                    },
                  ),
                  DatePickerWidget(
                    dateTitle: "إلى",
                    onTap: () async {
                      String? response = await myDatePicker(context);
                      if (response != null) {
                        formattedToDate = response;
                        setState(() {});
                      }
                    },
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
}
