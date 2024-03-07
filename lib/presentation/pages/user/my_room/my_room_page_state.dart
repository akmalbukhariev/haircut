class MyRoomPageState {
  bool isLoading;
  String? name;
  String? surName;
  String? phone;
  String? language;
  String? notification;

  MyRoomPageState({
    this.isLoading = false,
    this.name,
    this.surName,
    this.phone,
    this.language,
    this.notification
  });

  MyRoomPageState copyWith({
    bool? isLoading,
    String? name,
    String? surName,
    String? phone,
    String? language,
    String? notification
  }) {
    return MyRoomPageState(
        isLoading: isLoading ?? this.isLoading,
        name: name ?? this.name,
        surName: surName ?? this.surName,
        phone: phone ?? this.phone,
        language: language ?? this.language,
        notification: notification ?? this.notification
    );
  }
}