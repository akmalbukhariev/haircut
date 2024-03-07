enum NotificationId{
  none,
  n_5_minute,
  n_10_minute,
  n_20_minute,
  n_15_minute,
  n_30_minute,
  n_45_minute,
  n_1_hour,
  n_1_30_hour,
  n_2_hour,
}

String enumToStringNotification({required NotificationId notification}) {
  return notification.toString().split('.').last;
}

NotificationId stringToNotification(String value) {
  if(value.trim() == "") return NotificationId.n_5_minute;

  for (NotificationId id in NotificationId.values) {
    if (enumToStringNotification(notification: id) == value) {
      return id;
    }
  }
  return NotificationId.n_5_minute;
}