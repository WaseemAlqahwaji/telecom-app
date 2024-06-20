import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telecom_project/config/routes/app_router.dart';
import 'package:telecom_project/config/routes/route_path.dart';
import 'package:telecom_project/config/theming/theme.dart';

class TelecomApp extends StatelessWidget {
  final AppRouter appRouter;

  const TelecomApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: Routes.appGemsScreen,
        theme: KTheme.ligthTheme(),
        debugShowCheckedModeBanner: false,
        builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        ),
      ),
    );
  }
}
