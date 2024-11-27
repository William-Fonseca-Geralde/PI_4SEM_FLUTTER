import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/pages/add_domain_page.dart';
import 'package:domain_trader/src/features/domains_lists/presentation/widgets/list_domains.dart';
import 'package:domain_trader/src/features/users/data/models/user_model.dart';
import 'package:domain_trader/src/features/users/data/repositories/user_repository_impl.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/user_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyDomainsPage extends ConsumerStatefulWidget {
  const MyDomainsPage({super.key});

  @override
  ConsumerState<MyDomainsPage> createState() => _MyDomainsPageState();
}

class _MyDomainsPageState extends ConsumerState<MyDomainsPage> {
  UserModel? userModel;

  Future<void> _verifUser() async {
    final User? user = ref.read(supabaseProvider).auth.currentUser;
    final userRepository = UserRepositoryImpl(supabase: ref.read(supabaseProvider));
    final data = await userRepository.findUserbyId(user);

    if (mounted) {
      setState(() {
        userModel = data;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _verifUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          flex: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Meus Domínios',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: paddingPadrao),
              if (userModel?.nome == null || userModel?.nome == '')
                const UserLogin()
              else ...[
                const ListDomains(selectedOption: 'mydomains'),
              ]
            ],
          )
        )
      ),
      floatingActionButton: userModel?.nome != '' 
      ? FloatingActionButton.extended(
        label: const Text('Adicionar'),
        icon: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const AddDomainPage(),
          );
        },
      )
      : null
    );
  }
}