// lib/services/auth_service.dart
import '../data/mock_data.dart';
import '../models/user.dart';

class AuthService {
  User? _currentUser;

  User? get currentUser => _currentUser;

  // Login method
  Future<User?> login(String email, String password) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    try {
      final user = MockData.users.firstWhere(
        (user) => user.email == email && user.password == password,
      );

      _currentUser = user;
      return user;
    } catch (e) {
      return null;
    }
  }

  // Logout method
  Future<void> logout() async {
    await Future.delayed(Duration(milliseconds: 500));
    _currentUser = null;
  }

  // Check if user is logged in
  bool isLoggedIn() {
    return _currentUser != null;
  }

  // Get user by ID
  User? getUserById(String id) {
    try {
      return MockData.users.firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }
}
