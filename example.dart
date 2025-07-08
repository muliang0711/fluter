import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/// ─────────────────────────────────────────────
/// 🏠 Main Application Entry
/// ─────────────────────────────────────────────
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final UserManager manager = UserManager();
    final List<User> users = manager.getAllUsers();

    return MaterialApp(
      title: 'User List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User List'),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final User user = users[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(user.id.toString()),
                ),
                title: Text(user.name),
                subtitle: Text(user.email),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// ─────────────────────────────────────────────
/// 1️⃣ Entity Class — Represents one data item
/// ─────────────────────────────────────────────
class User {
  final int id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });
}

/// ─────────────────────────────────────────────
/// 2️⃣ Entity Manager — Handles logic
/// ─────────────────────────────────────────────
class UserManager {
  // Simulated list of users
  final List<User> _users = [
    User(id: 1, name: 'Alice', email: 'alice@example.com'),
    User(id: 2, name: 'Bob', email: 'bob@example.com'),
    User(id: 3, name: 'Charlie', email: 'charlie@example.com'),
  ];

  // Get all users
  List<User> getAllUsers() {
    return _users;
  }

  // Add a new user
  void addUser(User user) {
    _users.add(user);
  }

  // Find user by ID
  User? getUserById(int id) {
    return _users.firstWhere(
      (user) => user.id == id,
      orElse: () => User(id: 0, name: 'Unknown', email: ''),
    );
  }
}
