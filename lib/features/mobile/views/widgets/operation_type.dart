import 'package:flutter/material.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum OperationsType { prePaid, cash, postPaid }

class OperationType extends StatefulWidget {
  const OperationType({super.key});

  @override
  State<OperationType> createState() => _OperationTypeState();
}

class _OperationTypeState extends State<OperationType> {
  OperationsType? typeOfOperation;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: OperationsType.values.length,
        physics:const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context,int index){
        return  Padding(
          padding:  (index==OperationsType.values.length)?EdgeInsets.only(left: 0.0.w):EdgeInsets.only(left: 14.0.w),
          child: MainButton (
            width: 113.w,
            height: 49.h,
            fitBox: true,
              isBackGroungWhite:(typeOfOperation == OperationsType.values[index]) ? false : true,
            lable: OperationsType.values[index].name,
            onPressd: (){
              setState(() {
                typeOfOperation=OperationsType.values[index];
              });

            },
          ),
        );
        });
  }
}
