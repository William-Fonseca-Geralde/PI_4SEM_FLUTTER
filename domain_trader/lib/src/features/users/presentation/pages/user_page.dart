import 'package:domain_trader/src/features/users/presentation/widgets/user_login.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/user_settings.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          flex: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 80,
                    child: const UserSettings(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}