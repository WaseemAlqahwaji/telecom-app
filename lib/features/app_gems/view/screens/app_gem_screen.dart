import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/theming/theme.dart';
import 'package:telecom_project/features/core/view/screens/core_screen.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telecom_project/features/core/view/widgets/main_text_form_component.dart';

class AppGemScreen extends StatefulWidget {
  const AppGemScreen({super.key});

  @override
  State<AppGemScreen> createState() => _AppGemScreenState();
}

class _AppGemScreenState extends State<AppGemScreen> {
  List<String> data = [
    'assets/images/bigo.jpg',
    'assets/images/cash.png',
    'assets/images/currency.png',
    'assets/images/currency.png',
    'assets/images/bigo.jpg',
    'assets/images/bigo.jpg',
    'assets/images/bigo.jpg',
  ];

  Widget _buildItemList(BuildContext context, int index) {
    return Container(
      width: 223.74.w,
      height: 138.h,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(data[index]),
          ),
        border: Border.all(
          color: KTheme.mainColor,
          width: 2.w,
        ),
        borderRadius: BorderRadius.circular(24.r)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Set initial index to the middle of the data
    int lengthOfData=data.length;
    double initialIndex = (lengthOfData/2);
    return CoreScreen(
      child: Column(
        children: [
          Container(
            //width: MediaQuery.of(context).size.width,
              height: 138.h,
              child: ScrollSnapList(
                        initialIndex: initialIndex.toDouble(),
                        onItemFocus: (index) {
                          print('Focused item index: $index');
                        },
                        dynamicItemOpacity: 0.3,
                        dynamicItemSize: true,
                        itemBuilder: _buildItemList,
                        itemSize:  100.74.w, // Set item size to 100
                        //dynamicItemSize: false, // Disable dynamic item size
                        onReachEnd: () {
                          print('Done!');
                        },
                        itemCount: data.length,

                 ),
            ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w),
            child:  Column(
              children: [
                const MainTextFormComponent(
                  title: 'أدخل ال ID:',
                  hintText: 'أدخل ID الحساب في اللعبة او التطبيق',
                  textDirection: TextDirection.ltr,
                ),
                Gap(28.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    LayoutBuilder(
                      builder: (context,cons) {
                        print(cons.maxHeight);
                        return MainTextFormComponent(
                           title: 'المبلغ :',
                           hintText: 'السعر / القيمة',
                           textDirection: TextDirection.ltr,
                         );
                      }
                    ),
                    Gap(10.h),
                    Column(
                      children: [
                        LayoutBuilder(
                          builder: (context,cons) {
                            return Image.asset('assets/images/Vector.png');
                          }
                        ),
                      ],
                    ),
                    Gap(10.h),
                    const Expanded(
                      child:  MainTextFormComponent(
                        title: 'المبلغ :',
                        hintText: 'السعر / القيمة',
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                )
              ],

            ),
          ),

        ],
      ),
    );
  }
}
