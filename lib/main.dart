import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecom_project/config/helpers/bloc_observer.dart';
import 'package:telecom_project/config/routes/app_router.dart';
import 'package:telecom_project/telecom_client.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  runApp(TelecomApp(appRouter: AppRouter()));
}
