String timeDiffNow(String stringTime) {
  if (stringTime != null) {
    List<String> dateTime = stringTime.split('T');
    List<String> date = dateTime.first.split('-');
    List<String> time = dateTime.last.split(':');
    Duration duration = DateTime.now().difference(DateTime.utc(
      int.parse(date[0]),
      int.parse(date[1]),
      int.parse(date[2]),
      int.parse(time[0]),
      int.parse(time[1]),
      int.parse(time[2].split('.').first),
    ).toLocal());
    int days = duration.inDays;
    if (days >= 365) {
      return '${(days / 365).floor()} Years Ago.';
    } else if (days >= 30) {
      return '${(days / 30).floor()} Months Ago.';
    } else if (days >= 7) {
      return '${(days / 7).floor()} Weeks Ago.';
    } else if (days >= 1) {
      return '$days Days Ago.';
    } else {
      int min = duration.inMinutes;
      if (min >= 60) {
        return '${(min / 60).floor()} Hours Ago.';
      } else if (min >= 1) {
        return '$min Minutes Ago.';
      } else {
        return 'Few Seconds Ago.';
      }
    }
  }
  return '';
}

String timeDiffNowLocal(String stringTime) {
  List<String> dateTime = stringTime.split(' ');
  List<String> date = dateTime.first.split('-');
  List<String> time = dateTime.last.split(':');
  Duration duration = DateTime.now().difference(DateTime.utc(
    int.parse(date[0]),
    int.parse(date[1]),
    int.parse(date[2]),
    int.parse(time[0]),
    int.parse(time[1]),
    int.parse(time[2].split('.').first),
  ).toLocal());
  int days = duration.inDays;
  if (days >= 365) {
    return '${(days / 365).floor()} Years Ago.';
  } else if (days >= 30) {
    return '${(days / 30).floor()} Months Ago.';
  } else if (days >= 7) {
    return '${(days / 7).floor()} Weeks Ago.';
  } else if (days >= 1) {
    return '$days Days Ago.';
  } else {
    int min = duration.inMinutes;
    if (min >= 60) {
      return '${(min / 60).floor()} Hours Ago.';
    } else if (min >= 1) {
      return '$min Minutes Ago.';
    } else {
      return 'Few Seconds Ago.';
    }
  }
}
