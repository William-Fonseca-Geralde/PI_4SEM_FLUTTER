import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/users/presentation/widgets/settings.dart';
import 'package:domain_trader/features/users/presentation/widgets/user_settings.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Perfil',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            const UserSettings(),
            const Settings(),
          ],
        ),
      ),
    );
  }
}