import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/features/core/domain/enums/mobile_networks.dart';
import 'package:telecom_project/features/core/view/screens/core_screen.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:telecom_project/features/core/view/widgets/main_text_form_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telecom_project/features/core/view/widgets/selectable_containers.dart';
import 'package:telecom_project/features/mobile/views/widgets/operation_type.dart';
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
                const MainTextFormComponent(
                  title: 'الرقم',
                  hintText: 'أدخل الرقم أو الكود',
                ),
                Gap(24.h),
                SizedBox(height: 49.h, child: const OperationType()),
                Gap(24.h),
                const MainTextFormComponent(
                  title: 'الكمية',
                  hintText: 'أدخل الكمية',
                ),
                Gap(24.h),
                MainButton(
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

  List<Tuple2<String, MobileNetworks>> cardItemsdata = [
    const Tuple2("assets/images/syriatel.png" , MobileNetworks.syriatel),
    const Tuple2("assets/images/mtn.png" , MobileNetworks.mtn),
  ];
}
