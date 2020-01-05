class DurationString {
  String days;
  String hours;

  DurationString(
  {this.days,
  this.hours}
      );

  String toString() {
//    print('${this.days} ${this.hours}');
    double days;
      days = double.tryParse(this.days);
      if (days == null)
        days = 0;
    double hours = double.tryParse(this.hours);
    int hoursInt = 0;
    String returnString = "";
    if(hours % 1 == 0)
      hoursInt = hours.round();
//    print('hoursInt $hoursInt');

    if (days != 0)
      returnString += days.toString() + " DAYS, ";
    if (hoursInt != 0)
      returnString += hoursInt.toString() + " HOURS";
    else if (hours != 0)
      returnString += hours.toString() + " HOURS";

    return returnString;
  }
}

class DurationDateString {
  String startDateString;
  String endDateString;
  final format;

  DurationDateString({
    this.startDateString,
    this.endDateString,
    this.format
});

  DateTime convertDateFromString(String strDate){
    DateTime dateTime = DateTime.parse(strDate);
//    print(todayDate);
//    print(formatDate(todayDate, [yyyy, '/', mm, '/', dd, ' ', hh, ':', nn, ':', ss, ' ', am]));
    return dateTime;
  }

  String toString() {
    String returnString = "";
    var startDate = convertDateFromString(startDateString);
    var endDate = convertDateFromString(endDateString);
    if (startDate == endDate)
      returnString += "${startDate.day}-${startDate.month}-${startDate.year}";
    else if (startDate.day < endDate.day)
      returnString += "${startDate.day} to ${endDate.day}-${startDate.month}-${startDate.year}";
    return returnString;
  }
}