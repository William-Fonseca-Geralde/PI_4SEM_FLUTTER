import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/core/providers/app_provider.dart';
import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/users/data/models/user_model.dart';
import 'package:domain_trader/src/features/users/data/repositories/user_repository_impl.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/edit_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserSettings extends ConsumerStatefulWidget {
  const UserSettings({super.key});

  @override
  ConsumerState<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends ConsumerState<UserSettings> {
  String? userName;

  Future<void> _checarUsuario() async {
    final userRepository = UserRepositoryImpl(supabase: ref.read(supabaseProvider));
    final User? user = ref.read(supabaseProvider).auth.currentUser;

    final UserModel userModel = await userRepository.findUserbyId(user);

    setState(() {
      userName = userModel.nome;
    });
  }

  Future<void> _logoutUser() async {
    if (userName != '') {
      await ref.read(supabaseProvider).auth.signOut();
      Navigator.of(context).pushNamed('/home');
    }
  }

  @override
  void initState() {
    super.initState();
    _checarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Perfil',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: paddingPadrao),
        Card.outlined(
          margin: const EdgeInsets.symmetric(horizontal: paddingPadrao*4),
          child: Padding(
            padding: const EdgeInsets.all(paddingPadrao),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(paddingPadrao),
                  child: CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person),
                  ),
                ),
                Text(
                  '$userName',
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                const SizedBox(
                  height: paddingPadrao,
                ),
                FilledButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditUser(),
                    );
                  },
                  child: const Text('Editar Conta')
                ),
                const SizedBox(
                  height: paddingPadrao,
                ),
                FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(cancelColor),
                  ),
                  onPressed: () {
                    _logoutUser();
                  },
                  child: const Text('Sair da Conta')
                ),
                const SizedBox(
                  height: paddingPadrao,
                ),
                Card.outlined(
                  child: Padding(
                    padding: const EdgeInsets.all(paddingPadrao),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Tema: ',
                          style: Theme.of(context).textTheme.bodyLarge
                        ),
                        IconButton(
                          onPressed: () {
                            ref.read(brightnessProvider.notifier).update((state) => !state);
                          },
                          icon: Icon(
                            ref.watch(brightnessProvider)
                            ? Icons.dark_mode
                            : Icons.light_mode
                          )
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}