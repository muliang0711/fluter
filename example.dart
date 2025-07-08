import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/// ─────────────────────────────────────────────
/// 🏠 Main Application Entry
/// ─────────────────────────────────────────────
/// 
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const UserScreen(),
    );
  }
}

/// ─────────────────────────────────────────────
/// 3️⃣ UI Layer — Interacts with the user
/// ─────────────────────────────────────────────
class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
  //  We use StatefulWidget because the user list will change.
  //  createState() returns a _UserScreenState, which holds the mutable logic and UI.
  //  UserScreen is like a "shell", and _UserScreenState is where the real logic lives.

 
}

class _UserScreenState extends State<UserScreen> {
  final UserManager manager = UserManager();
  List<User> displayedUsers = [];

  void _getAllUsers() {
    setState(() { // tells flutter something change rebuild the screen 
      displayedUsers = manager.getAllUsers();
    });
  }

  void _getUserById(int id) {
    User? foundUser = manager.getUserById(id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'User ID $id → ${foundUser.name} (${foundUser.email})',
        ),
      ),
    );
  }

  void _addUser() {
    int newId = manager.getAllUsers().length + 1;
    manager.addUser(
      User(id: newId, name: 'User $newId', email: 'user$newId@example.com'),
    );
    _getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Manager')),
      body: Column(
        children: [
          // ───── Buttons for Actions ─────
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 12,
              children: [
                ElevatedButton(
                  onPressed: _getAllUsers,
                  child: const Text('Get All Users'),
                ),
                ElevatedButton(
                  onPressed: () => _getUserById(2),
                  child: const Text('Get User by ID = 2'),
                ),
                ElevatedButton(
                  onPressed: _addUser,
                  child: const Text('Add New User'),
                ),
              ],
            ),
          ),

          const Divider(),

          // ───── Display Users ─────
          Expanded(
            child: ListView.builder(
              itemCount: displayedUsers.length,
              itemBuilder: (context, index) {
                final user = displayedUsers[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(child: Text(user.id.toString())),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  ),
                );
              },
            ),
          ),
        ],
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
  final List<User> _users = [
    User(id: 1, name: 'Alice', email: 'alice@example.com'),
    User(id: 2, name: 'Bob', email: 'bob@example.com'),
    User(id: 3, name: 'Charlie', email: 'charlie@example.com'),
  ];

  List<User> getAllUsers() => _users;

  void addUser(User user) => _users.add(user);

  User getUserById(int id) {
    return _users.firstWhere(
      (user) => user.id == id,
      orElse: () => User(id: 0, name: 'Not Found', email: 'N/A'),
    );
  }
}
