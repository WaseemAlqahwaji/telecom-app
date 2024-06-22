import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum OperationsType {prePaid,cash,postPaid}

class OperationType extends StatefulWidget {

   OperationType ({super.key});

  @override
  State<OperationType> createState() => _OperationTypeState();
}

class _OperationTypeState extends State<OperationType> {
  OperationsType? typeOfOperation;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MainButton(
          width: 113.w,
            height: 49.h,
            fitBox: true,
            maxLines: 1,
            isBackGroungWhite: (typeOfOperation==OperationsType.postPaid)?false:true,
            lable: 'لاحق الدفع',onPressd: (){
            setState(() {
              typeOfOperation=OperationsType.postPaid;

            });

          }),
        Gap(14.w),
        MainButton(
            width: 113.w,
            height: 49.h,
            fitBox: true,
            maxLines: 1,
            isBackGroungWhite: (typeOfOperation==OperationsType.cash)?false:true,
            lable: 'Cash',onPressd: (){
              setState(() {
                typeOfOperation=OperationsType.cash;
              });

        }),
        Gap(14.w),
        MainButton(
            width: 113.w,
            height: 49.h,
            fitBox: true,
            maxLines: 1,
            isBackGroungWhite: (typeOfOperation==OperationsType.prePaid)?false:true,
            lable: 'مسبق الدفع',onPressd: (){

          setState(() {
            typeOfOperation=OperationsType.prePaid;
          });
        })
      ],
    );
  }
}
