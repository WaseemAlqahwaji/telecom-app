import 'package:flutter/material.dart';
import 'package:telecom_project/config/routes/app_router.dart';
import 'package:telecom_project/telecom_client.dart';

void main() async {
  runApp(TelecomApp(appRouter: AppRouter()));
}
