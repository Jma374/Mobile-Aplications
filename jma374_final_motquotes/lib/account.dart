import 'package:flutter/material.dart';
import 'user.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  final User mockUser = const User(
    name: 'Juan Martin Alarcon',
    email: 'jma@umiami.edu',
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFF2575FC), // 🔵 On-brand blue
            child: Icon(Icons.person,
                size: 50, color: Color.fromARGB(255, 12, 2, 2)),
          ),
          const SizedBox(height: 16),
          Text(
            mockUser.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            mockUser.email,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
