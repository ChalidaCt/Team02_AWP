class UserData {
  final String username;
  final String contact;
  final String password;
  final String role;
  double foodInTank;
  double maxFood;
  List<String> schedules;
  List<String> history;

  UserData({
    required this.username,
    required this.contact,
    required this.password,
    required this.role,
    required this.foodInTank,
    required this.maxFood,
    required this.schedules,
    required this.history,
  });
}