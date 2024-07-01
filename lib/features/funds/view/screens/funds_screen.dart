import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/features/core/data/models/enums/mobile_networks.dart';
import 'package:telecom_project/features/core/view/screens/core_screen.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:telecom_project/features/core/view/widgets/main_text_form_component.dart';
import 'package:telecom_project/features/core/view/widgets/selectable_containers.dart';
import 'package:telecom_project/features/core/view/widgets/selectable_row.dart';
import 'package:telecom_project/features/funds/data/models/enums/operation.dart';
import 'package:tuple/tuple.dart';

class FundsScreen extends StatefulWidget {
  const FundsScreen({super.key});

  @override
  State<FundsScreen> createState() => _FundsScreenState();
}

class _FundsScreenState extends State<FundsScreen> {
  bool isPrePaid = true;
  @override
  Widget build(BuildContext context) {
    return CoreScreen(
      resizeToAvoidBottomInset: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(10.0.h),
              SizedBox(
                height: 180.0.h,
                child: SelectableContainers(
                  itemsData: _cardItemsdata,
                  screenHorizontalPadding: 30.0.w,
                ),
              ),
              Gap(30.0.h),
              const AppTextForm(
                title: "الرقم : ",
                hintText: "أدخل الرقم أو الكود",
              ),
              Gap(18.0.h),
              const AppTextForm(
                title: "الكود : ",
                hintText: "أدخل الكود",
              ),
              Gap(24.h),
              SizedBox(
                height: 50.h,
                child: SelectableRow(
                  datalist: selectableRowData(),
                  onChange: (value) {
                    print(value);
                  },
                ),
              ),
              Gap(24.h),
              const AppTextForm(
                title: "المبلغ : ",
                hintText: "أدخل الكمية",
              ),
              Gap(32.0.h),
              AppButton(
                onPressd: () {},
                height: 56.h,
                width: double.infinity,
                lable: "أرسال الطلب",
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Tuple2<dynamic, String>> selectableRowData() {
    List<Tuple2<dynamic, String>> data = [];
    List<String> lables = ["مسبق الدفع", "لاحق الدفع"];
    for (int i = 0; i < Operation.values.length; i++) {
      data.add(Tuple2(Operation.values[i], lables[i]));
    }
    return data;
  }

  final List<Tuple2<String, MobileNetworks>> _cardItemsdata = [
    const Tuple2("assets/images/syriatel.png", MobileNetworks.syriatel),
    const Tuple2("assets/images/mtn.png", MobileNetworks.mtn),
  ];
}
