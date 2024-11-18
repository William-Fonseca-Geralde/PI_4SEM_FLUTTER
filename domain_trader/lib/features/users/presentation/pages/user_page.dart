import 'package:domain_trader/features/users/presentation/widgets/user_settings.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Perfil',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const UserSettings(),
            ],
          ),
        ],
      ),
    );
  }
}