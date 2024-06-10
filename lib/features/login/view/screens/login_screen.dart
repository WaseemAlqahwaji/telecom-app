import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:telecom_project/config/helpers/extensions.dart';
import 'package:telecom_project/config/helpers/hex_color.dart';
import 'package:telecom_project/config/routes/route_path.dart';
import 'package:telecom_project/config/theming/text_style.dart';
import 'package:telecom_project/config/theming/theme.dart';
import 'package:telecom_project/features/core/view/screens/background_screens.dart';
import 'package:telecom_project/features/core/view/widgets/main_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#FFFFFF"),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CoreScreen(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Container(
                      width: 200.w,
                      height: 200.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/telecom_logo.png",
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "أهلا وسهلا",
                      style: TextStyled.font24DarkBlue400,
                    ),
                    const Gap(10.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "اسم المستخدم :",
                        style: TextStyled.font16Grey400,
                      ),
                    ),
                    Gap(10.0.h),
                    TextFormField(
                      controller: userNameController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Gap(10.0.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "كلمة المرور :",
                        style: TextStyled.font16Grey400,
                      ),
                    ),
                    Gap(10.0.h),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    Gap(20.0.h),
                    Row(
                      children: [
                        SizedBox(
                          height: 20.0.h,
                          width: 20.0.w,
                          child: Checkbox(
                            activeColor: KTheme.mainColor,
                            side:
                                BorderSide(color: KTheme.secondColor, width: 2),
                            value: isChecked,
                            shape: const CircleBorder(),
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                        Gap(5.0.w),
                        const Expanded(
                          child: Text(
                            "تذكر معلومات حسابي في المرات القادمة",
                          ),
                        ),
                      ],
                    ),
                    Gap(20.0.h),
                    MainButton(
                      onPressd: () {
                        context.pushReplacementNamed(Routes.homeScreen);
                      },
                      lable: "تسجيل دخول",
                      width: double.infinity,
                    ),
                    const Spacer(
                      flex: 6,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
