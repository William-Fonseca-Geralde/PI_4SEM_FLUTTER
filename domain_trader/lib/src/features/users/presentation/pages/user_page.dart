import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/users/data/models/user_model.dart';
import 'package:domain_trader/src/features/users/data/repositories/user_repository_impl.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/user_login.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/user_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserPage extends ConsumerStatefulWidget {
  const UserPage({super.key});

  @override
  ConsumerState<UserPage> createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<UserPage> {
  String? userName;

  Future<void> _checarUsuario() async {
    final userRepository = UserRepositoryImpl(supabase: ref.read(supabaseProvider));
    final User? user = ref.read(supabaseProvider).auth.currentUser;

    final UserModel userModel = await userRepository.findUserbyId(user);

    setState(() {
      userName = userModel.nome;
    });
  }

  @override
  void initState() {
    super.initState();
    _checarUsuario();
  }

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
                    width: MediaQuery.sizeOf(context).width / 4,
                    child: userName == ''
                    ? const UserLogin()
                    : const UserSettings()
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