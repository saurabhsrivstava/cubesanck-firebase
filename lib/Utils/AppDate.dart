import 'package:intl/intl.dart';

class AppDate {
  static stringToTime(String str) {
    DateTime date = DateFormat.jm().parse(str);
    return date;
  }

  static timeTo24(DateTime date) {
    String timeStr = DateFormat.Hm().format(date);
    return timeStr;
  }

  static time24String(String time) {
    final t1Time = stringToTime(time);
    final t1str = timeTo24(t1Time);
    return t1str;
  }

  static toFormate(DateTime date) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    final dates = dateFormat.format(date);
    return dates;
  }

  static todayDate() {
    DateTime selectedDate = DateTime.now();
    final dateToSend = "${selectedDate.toLocal()}".split(' ')[0];
    return dateToSend;
  }

  static dateFormate(dateStr) {
    DateTime date = DateTime.parse(dateStr);
    final DateFormat formatter = DateFormat('MMMM-dd-yyyy');
    final String formatted = formatter.format(date);
    return formatted;
  }
}
