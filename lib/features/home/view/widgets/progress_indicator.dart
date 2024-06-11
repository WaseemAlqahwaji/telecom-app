import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../../config/theming/text_style.dart';

class MyProgressIndicator extends StatefulWidget{
  final int currentIncome;
  final int maxSalary;

  const MyProgressIndicator({super.key,required this.currentIncome,required this.maxSalary});

  @override
  State<StatefulWidget> createState() {
    return _ProgressIndicator();
  }
  
}

class _ProgressIndicator extends State<MyProgressIndicator> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _valueAnimation;
  late Animation<double> _percentageAnimation;

  int getIncomePercentage(int income,int currentIncome){
    double percent;
    percent=(currentIncome*100)/income;
    return percent.toInt();
  }
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: widget.currentIncome.toDouble()).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _valueAnimation = Tween<double>(begin: 0, end: widget.currentIncome.toDouble()).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _percentageAnimation = Tween<double>(begin: 0, end: getIncomePercentage(10000, widget.currentIncome).toDouble()).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }
 @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   SizedBox(
      width: 180.w,
      height: 180.h,
      child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: widget.maxSalary.toDouble(),
              // showLabels: false,
              // showTicks: false,
              startAngle: 180,
              endAngle: 180,
              //radiusFactor: 0.4,
              axisLineStyle: AxisLineStyle(
                thickness: 0.1,
                color: const Color(0xff52B7DC).withOpacity(0.25),
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: <GaugePointer>[
                // RangePointer(
                //   value: _animation.value,
                //   width: 0.01,
                //   color: const Color(0xff282561).withOpacity(0.7),
                //   pointerOffset: 0.01,
                //   cornerStyle: CornerStyle.bothFlat,
                //   sizeUnit: GaugeSizeUnit.factor,
                // ),
                RangePointer(
                  value: _animation.value,
                  width: 0.1,
                  color: const Color(0xff282561),
                  pointerOffset: 0.001,
                  //cornerStyle: CornerStyle.bothCurve,
                  sizeUnit: GaugeSizeUnit.factor,
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/currency.png', width: 45.w, height: 30.h, fit: BoxFit.fitWidth),
                      const SizedBox(height: 4),
                      Text(
                        _valueAnimation.value.toStringAsFixed(0),
                        style: TextStyled.font16DarkBlue400
                      ),
                      Text(
                        '${_percentageAnimation.value.toStringAsFixed(0)}%',
                        style: TextStyled.font16DarkBlue400
                      ),
                    ],
                  ),
                  angle: 90,
                  positionFactor: 0.1,
                ),
              ],
            ),
          ],
        ),
    );

  }

}