class FeedSchedule {
  String time;
  int amount;
  bool enabled;

  FeedSchedule({
    required this.time,
    required this.amount,
    this.enabled = true,
  });
}