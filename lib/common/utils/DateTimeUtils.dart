class DateTimeUtils {
  DateTime _dateTime;
  get dateTime => _dateTime;

  DateTimeUtils(int unixSecondTimeStamp) {
    _dateTime = DateTime.fromMillisecondsSinceEpoch(unixSecondTimeStamp * 1000);
  }

  static String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  /// month-day hour:minute
  String toMDHMString() {
    return "${_twoDigits(_dateTime.month)}-${_twoDigits(_dateTime.day)} "
        + "${_twoDigits(_dateTime.hour)}:${_twoDigits(_dateTime.minute)}";
  }
}