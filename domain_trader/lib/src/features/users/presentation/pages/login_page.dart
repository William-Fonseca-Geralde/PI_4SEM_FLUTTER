import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/users/data/repositories/user_repository_impl.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_password.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_text.dart';
import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _entrarConta() async {
    if (_formKey.currentState?.validate() ?? false) {
      final userRepository = UserRepositoryImpl(supabase: ref.read(supabaseProvider));

      try {
        await userRepository.loginUser(_emailController.text, _passwordController.text);

        if (mounted) {
          Navigator.of(context).pushNamed('/home');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              showCloseIcon: true,
              width: MediaQuery.of(context).size.width - 80,
              content: const Text('Usuário cadastrado'),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(paddingPadrao / 2),
              ),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            showCloseIcon: true,
            width: MediaQuery.of(context).size.width - 80,
            content: Text('Erro ao entrar na conta: $e'),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(paddingPadrao / 2),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24
                    ),
                  ),
                ),
                InputText(
                  controller: _emailController,
                  prefixIcon: const Icon(Icons.email_rounded),
                  hintText: 'Ex: jorge.amado@gmail.com',
                  typeText: 'email', labelText: 'E-mail'
                ), 
                InputPassword(
                  controller: _passwordController,
                  hintText: '',
                  labelText: 'Senha',
                  helpText: null
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
                        onPressed: () {
                          _entrarConta();
                        },
                        child: const Text('Entrar na Conta'),
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
                      const Text('Ainda não possui conta?'),
                      FilledButton.tonal(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/cadastro');
                        },
                        child: const Text('Cadastrar')
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