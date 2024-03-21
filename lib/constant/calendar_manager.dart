class CalendarManager {
  static List<String>? monthList;

  CalendarManager() {
    monthList = [
      "Yanvar", "Fevral", "Mart", "Aprel", "May", "Iyun",
      "Iyul", "Avgust", "Sentabr", "Oktabr", "Noyabr", "Dekabr"
    ];
  }

  String getMonthName(DateTime date) {
    int month = date.month;
    String monthName = monthList?[month - 1] ?? '';
    return monthName;
  }
}
