import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/features/core/data/models/enums/mobile_networks.dart';
import 'package:telecom_project/features/core/view/screens/core_screen.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:telecom_project/features/core/view/widgets/app_text_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telecom_project/features/core/view/widgets/selectable_containers.dart';
import 'package:telecom_project/features/mobile/data/models/enums/opration_type.dart';
import 'package:telecom_project/features/core/view/widgets/selectable_row.dart';
import 'package:telecom_project/features/mobile/views/widgets/quantity_dialog.dart';
import 'package:tuple/tuple.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreen();
}

class _MobileScreen extends State<MobileScreen> {
  double screenHorizontalPadding = 30.0.w;
  @override
  Widget build(BuildContext context) {
    return CoreScreen(
      resizeToAvoidBottomInset: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenHorizontalPadding),
        child: Column(
          children: [
            Gap(10.h),
            SizedBox(
              height: 180.0.h,
              child: SelectableContainers(
                itemsData: cardItemsdata,
                screenHorizontalPadding: screenHorizontalPadding,
              ),
            ),
            Gap(24.h),
            Column(
              children: [
                const AppTextForm(
                  title: 'الرقم',
                  hintText: 'أدخل الرقم أو الكود',
                ),
                Gap(24.h),
                SizedBox(
                  height: 49.h,
                  child: SelectableRow(
                    datalist: selectableRowData(),
                    onChange: (value) {},
                  ),
                ),
                Gap(24.h),
                AppTextForm(
                  title: 'الكمية',
                  hintText: 'أدخل الكمية',
                  readOnly: true,
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return QuantityDialog(
                          dialogData: dialogData,
                        );
                      },
                    );
                  },
                ),
                Gap(24.h),
                AppButton(
                  width: double.infinity,
                  onPressd: () {},
                  lable: 'إرسال الطلب',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Tuple2<dynamic, String>> selectableRowData() {
    List<Tuple2<dynamic, String>> data = [];
    List<String> lables = ["مسبق الدفع", "كاش", "لاحق الدفع"];
    for (int i = 0; i < OperationsType.values.length; i++) {
      data.add(Tuple2(OperationsType.values[i], lables[i]));
    }
    return data;
  }

  List<Tuple2<int, int>> dialogData = [
    const Tuple2(40, 50),
    const Tuple2(65, 75),
    const Tuple2(90, 100),
    const Tuple2(95, 110),
    const Tuple2(100, 115),
    const Tuple2(40, 50),
    const Tuple2(65, 75),
    const Tuple2(90, 100),
    const Tuple2(95, 110),
    const Tuple2(100, 115),
    const Tuple2(100, 115),
    const Tuple2(40, 50),
    const Tuple2(65, 75),
    const Tuple2(90, 100),
    const Tuple2(95, 110),
    const Tuple2(100, 115),
  ];

  List<Tuple2<String, MobileNetworks>> cardItemsdata = [
    const Tuple2("assets/images/syriatel.png", MobileNetworks.syriatel),
    const Tuple2("assets/images/mtn.png", MobileNetworks.mtn),
  ];
}
