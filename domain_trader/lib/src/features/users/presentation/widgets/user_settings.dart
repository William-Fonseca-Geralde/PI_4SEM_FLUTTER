import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/core/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSettings extends ConsumerWidget {
  const UserSettings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          'Perfil',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
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
                  'Nome do Usuário',
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                const SizedBox(
                  height: paddingPadrao,
                ),
                FilledButton(
                  onPressed: () {
                                
                  },
                  child: const Text('Editar Conta')
                ),
                const SizedBox(
                  height: paddingPadrao,
                ),
                FilledButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red)
                  ),
                  onPressed: () {
                  
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