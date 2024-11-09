import 'package:intl/intl.dart';

class FormatDate {

  //To Convert ISO 8601 date to "Month, DD, YYYY" (e.g. "January 1, 2023")
  static String format(String date) {
    DateTime dateTime = DateTime.parse(date);

    // Format it to "Month, DD, YYYY"
    String formattedDate = DateFormat('MMMM dd, yyyy').format(dateTime);

    //for returning formatted Date
    return formattedDate;
  }
}