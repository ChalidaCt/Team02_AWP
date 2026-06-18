import '../models/user_model.dart';

class MockDatabase {
  static final List<UserData> users = [
    UserData(
      username: 'user',
      contact: 'user@email.com',
      password: '1234',
      role: 'user',
      foodInTank: 1000,
      maxFood: 1000,
      schedules: ['07:00 น. ให้อาหาร 50 กรัม', '18:00 น. ให้อาหาร 50 กรัม'],
      history: [],
    ),
  ];

  static UserData? login(String username, String password) {
    try {
      return users.firstWhere(
        (user) => user.username == username && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  static bool usernameExists(String username) {
    return users.any((user) => user.username == username);
  }

  static void addUser(UserData user) {
    users.add(user);
  }
}