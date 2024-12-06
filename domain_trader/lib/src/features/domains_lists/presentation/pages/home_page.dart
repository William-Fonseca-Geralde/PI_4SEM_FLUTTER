import 'package:animations/animations.dart';
import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/core/providers/app_provider.dart';
import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/pages/domains_page.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/pages/my_domains_page.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/navbar.dart';
import 'package:domain_trader/src/features/users/data/models/user_model.dart';
import 'package:domain_trader/src/features/users/data/repositories/user_repository_impl.dart';
import 'package:domain_trader/src/features/users/presentation/pages/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int currentPageIndex = 0;
  String? userName;

  Future<String> _checarUsuario() async {
    final userRepository = UserRepositoryImpl(supabase: ref.read(supabaseProvider));
    final User? user = ref.read(supabaseProvider).auth.currentUser;

    final UserModel userModel = await userRepository.findUserbyId(user);

    setState(() {
      userName = userModel.nome;
    });

    return userModel.nome;
  }

  @override
  void initState() {
    super.initState();
    _checarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 250,
            child: NavigationDrawer(
              tilePadding: const EdgeInsets.all(paddingPadrao),
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              selectedIndex: currentPageIndex,
              children: [
                const Padding(
                  padding: EdgeInsets.all(paddingPadrao),
                  child: Navbar(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: paddingPadrao * 5, left: paddingPadrao, bottom: paddingPadrao),
                  child: Card.filled(
                    child: Padding(
                      padding: const EdgeInsets.all(paddingPadrao / 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          userName == ''
                          ? TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              child: const Text('Entrar')
                            )
                          : TextButton(
                            onPressed: () {},
                            child: Text('$userName')
                          ),
                          const SizedBox(width: 5),
                          const CircleAvatar(
                            child: Icon(Icons.person)
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: paddingPadrao * 5, left: paddingPadrao, bottom: paddingPadrao),
                  child: Card.filled(
                    child: Padding(
                      padding: const EdgeInsets.all(paddingPadrao / 1.5),
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
                  ),
                ),
                const Divider(),
                const NavigationDrawerDestination(
                  icon: Icon(FontAwesomeIcons.gavel),
                  label: Text('Leilões')
                ),
                const NavigationDrawerDestination(
                  icon: Icon(CupertinoIcons.globe),
                  label: Text('Meus Domínios')
                ),
                const NavigationDrawerDestination(
                  icon: Icon(Icons.person),
                  label: Text('Perfil')
                ),
              ]
            ),
          ),
          Expanded(
            child: PageTransitionSwitcher(
              transitionBuilder: (child, animation, secondaryAnimation) {
                return SharedAxisTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.horizontal,
                  child: child,
                );
              },
              child: [
                const DomainsPage(),
                const MyDomainsPage(),
                const UserPage(),
              ][currentPageIndex],
            ),
          ),
        ],
      ),
    );
  }
}
