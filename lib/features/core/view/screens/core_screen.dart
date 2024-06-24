import 'package:flutter/material.dart';
import 'package:telecom_project/config/helpers/extensions.dart';
import 'package:telecom_project/features/core/view/widgets/main_appbar.dart';

class CoreScreen extends StatelessWidget {
  final Widget child;
  final bool? isWithAppbar;
  final bool? resizeToAvoidBottomInset;
  const CoreScreen({
    super.key,
    required this.child,
    this.isWithAppbar = true,
    this.resizeToAvoidBottomInset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getScreenWidth(),
      height: context.getScreenHeight(),
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("assets/images/backgroud_screens.png"),
      )),
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: Colors.transparent,
        appBar: isWithAppbar == true ? mainAppbar : null,
        // extendBodyBehindAppBar: true,
        body: child,
      ),
    );
  }
}
