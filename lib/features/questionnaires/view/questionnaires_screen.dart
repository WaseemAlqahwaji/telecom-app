import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/helpers/date_format.dart';
import 'package:telecom_project/features/core/view/screens/core_screen.dart';
import 'package:telecom_project/features/core/view/widgets/date_element.dart';
import 'package:telecom_project/features/core/view/widgets/date_picker.dart';
import 'package:telecom_project/features/core/view/widgets/expandable_widget.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:tuple/tuple.dart';

class QuestionnairesScreen extends StatefulWidget {
  const QuestionnairesScreen({super.key});

  @override
  State<QuestionnairesScreen> createState() => _QuestionnairesScreenState();
}

class _QuestionnairesScreenState extends State<QuestionnairesScreen> {
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
                itemBuilder: (context, index) => ExpandableWidget.expand(
                  expandableWidget: Tuple2(
                    true,
                    Column(
                      children: [
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.start,
                                "الاسم : حمودة عبسلام بازنكو",
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.end,
                                "الرقم: 011 - 8765 4321",
                              ),
                            ),
                          ],
                        ),
                        Gap(10.0.h),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                textAlign: TextAlign.start,
                                "المزود : السورية للاتصالات",
                              ),
                            ),
                            MainButton(
                              onPressd: () {},
                              lable: "دفع",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  icon: Icons.check,
                  iconColor: Colors.green,
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
