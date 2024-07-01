import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/helpers/date_format.dart';
import 'package:telecom_project/features/core/view/screens/core_screen.dart';
import 'package:telecom_project/features/core/view/widgets/date_element.dart';
import 'package:telecom_project/features/core/view/widgets/date_picker.dart';
import 'package:telecom_project/features/financial/view/widgets/financial_transiction_item.dart';

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
    return CoreScreen(
      child: Column(
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
                itemBuilder: (context, index) => FinancialTransictionItem(
                  index: index,
                ),
                separatorBuilder: (context, index) => Gap(8.h),
                itemCount: 5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
