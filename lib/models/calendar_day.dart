
class DayInfo{
  final bool isHoliday;
  final bool isToday;
  final bool isBusy;
  final bool isWeekend;
  final bool isSelected;
  final String text;

  DayInfo({
    this.isHoliday = false,
    this.isToday = false,
    this.isBusy = false,
    this.isWeekend = false,
    this.isSelected = false,
    this.text = "1"});
}