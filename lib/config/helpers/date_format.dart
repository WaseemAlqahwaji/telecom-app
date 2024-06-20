import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat.yMd().format(date);
}
