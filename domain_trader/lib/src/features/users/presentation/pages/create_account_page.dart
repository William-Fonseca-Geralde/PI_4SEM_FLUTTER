import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_password.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_text.dart';
import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateAccountPage extends ConsumerStatefulWidget {
  const CreateAccountPage({super.key});

  @override
  ConsumerState<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends ConsumerState<CreateAccountPage> {
  final GlobalKey<FormFieldState<String>> _passwordKey = GlobalKey();

  @override
  void initState() {
    _setupAuthListener();
    super.initState();
  }

  void _setupAuthListener() async {
    ref.read(supabaseProvider).auth.onAuthStateChange.listen(
      (data) {
        final AuthChangeEvent event = data.event;
        if (event case AuthChangeEvent.signedIn) {
          if (mounted) {
            Navigator.of(context).pushNamed('/home');
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Image.asset(
                  logo_login,
                  width: 200,
                  height: 200,
                ),
                const Padding(
                  padding: EdgeInsets.all(paddingPadrao),
                  child: Text(
                    'Cadastro',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24
                    ),
                  ),
                ),
                InputText(
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'Ex: Jorge Amado',
                  typeText: 'nome',
                  labelText: 'Nome do Usuário'
                ),
                InputText(
                  prefixIcon: const Icon(Icons.email_rounded),
                  hintText: 'Ex: jorge.amado@gmail.com',
                  typeText: 'email',
                  labelText: 'E-mail'
                ),
                InputText(
                  prefixIcon: const Icon(Icons.phone),
                  hintText: 'Ex: +55 (19) 97524-5417',
                  typeText: 'tell',
                  labelText: 'Telefone',
                ),
                InputPassword(
                  hintText: '',
                  labelText: 'Senha',
                  helpText: 'A senha deve conter:\n - no mínimo 8 caracteres;'
                ),
                InputPassword(
                  hintText: '',
                  labelText: 'Senha',
                  helpText: 'A senha ter que ser igual acima'
                ),
                const Padding(
                  padding: EdgeInsets.all(paddingPadrao),
                  child: Expanded(
                    child: Divider(
                      color: corPrimariaClara,
                      thickness: 2,
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(paddingPadrao),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilledButton(
                        onPressed: () {},
                        child: const Text('Cadatrar Conta'),
                      ),
                      FilledButton(
                        onPressed: () {
                          voltarIgnorando(context, ['/login', '/cadastro'], navigatorObserver);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(cancelColor)
                        ),
                        child: const Text('Voltar à Página'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(paddingPadrao),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Já tem conta cadastrada?'),
                      FilledButton.tonal(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        child: const Text('Entrar na conta')
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      )
    );
  }
}