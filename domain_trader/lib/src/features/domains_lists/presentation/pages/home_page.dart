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
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Navbar(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: paddingPadrao),
            child: Card.filled(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  userName == '' && user != null
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
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: PageTransitionSwitcher(
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
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget> [
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.gavel),
            label: 'Leilões'
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.globe),
            label: 'Meus Domínios'
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Perfil'
          )
        ]
      ),
    );
  }
}
