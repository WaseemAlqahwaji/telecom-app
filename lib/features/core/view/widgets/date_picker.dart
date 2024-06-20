import 'package:flutter/material.dart';
import 'package:telecom_project/config/helpers/date_format.dart';

Future<String?> myDatePicker(BuildContext context) async {
  var response = await showDatePicker(
    context: context,
    firstDate: DateTime(2001),
    lastDate: DateTime(2008),
  );
  if (response != null) return formatDate(response);
  return null;
}
