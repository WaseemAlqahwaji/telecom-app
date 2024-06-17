import 'package:flutter/material.dart';
import 'package:telecom_project/config/helpers/extensions.dart';
import 'package:telecom_project/config/routes/app_router.dart';
import 'package:telecom_project/features/core/view/widgets/main_appbar.dart';
import 'package:telecom_project/features/core/view/widgets/main_drawer.dart';

class CoreScreen extends StatefulWidget {
  final Widget child;
  const CoreScreen({
    super.key,
    required this.child,
  });

  @override
  State<CoreScreen> createState() => _CoreScreenState();
}


class _CoreScreenState extends State<CoreScreen> {
  @override
  void initState() {
    print(AppRouter.currnetScreenName);
    super.initState();
  }
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
        drawer: const MainDrawer(),
        backgroundColor: Colors.transparent,
        appBar: mainAppbar,
        // extendBodyBehindAppBar: true,
        body: widget.child,
      ),
    );
  }
}
