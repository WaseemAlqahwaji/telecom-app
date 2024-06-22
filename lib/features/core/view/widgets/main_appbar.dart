import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar mainAppbar = AppBar(
  actions: [
    Padding(
      padding: EdgeInsetsDirectional.only(
        end: 15.0.w,
        top: 10.0.h
      ),
      child: Image.asset("assets/images/logo.png"),
    )
  ],
);
