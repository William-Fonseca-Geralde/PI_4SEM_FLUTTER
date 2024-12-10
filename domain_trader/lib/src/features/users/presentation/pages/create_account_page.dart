import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/users/data/models/user_model.dart';
import 'package:domain_trader/src/features/users/data/repositories/user_repository_impl.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_password.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_text.dart';
import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateAccountPage extends ConsumerStatefulWidget {
  const CreateAccountPage({super.key});

  @override
  ConsumerState<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends ConsumerState<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _tellController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _cpfController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _tellController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  Future<void> _criarConta() async {
    if (_formKey.currentState?.validate() ?? false) {
      final userRepository = UserRepositoryImpl(supabase: ref.read(supabaseProvider));

      try {
        final user = UserModel(
          nome: _nameController.text,
          email: _emailController.text,
          tell: _tellController.text,
          senha: _passwordController.text,
        );

        await userRepository.createUser(user);

        if (mounted) {
          Navigator.of(context).pushNamed('/home');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              showCloseIcon: true,
              width: MediaQuery.of(context).size.width / 4,
              content: const Text('Usuário Criado!!!'),
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
            width: MediaQuery.of(context).size.width / 4,
            content: Text('Erro ao criar conta: $e'),
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
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
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
                        'Cadastro',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 24
                        ),
                      ),
                    ),
                    InputText(
                      controller: _nameController,
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Ex: Jorge Amado',
                      typeText: 'nome',
                      labelText: 'Nome do Usuário'
                    ),
                    InputText(
                      controller: _emailController,
                      prefixIcon: const Icon(Icons.email_rounded),
                      hintText: 'Ex: jorge.amado@gmail.com',
                      typeText: 'email',
                      labelText: 'E-mail'
                    ),
                    InputText(
                      controller: _cpfController,
                      prefixIcon: const Icon(FontAwesomeIcons.idCard),
                      hintText: 'Ex: 451.784.856-58',
                      typeText: 'cpf',
                      labelText: 'CPF'
                    ),
                    InputText(
                      controller: _tellController,
                      prefixIcon: const Icon(Icons.phone),
                      hintText: 'Ex: +55 (19) 97524-5417',
                      typeText: 'tell',
                      labelText: 'Telefone',
                    ),
                    InputPassword(
                      controller: _passwordController,
                      hintText: '',
                      labelText: 'Senha',
                      helpText: 'A senha deve conter:\n - no mínimo 8 caracteres;'
                    ),
                    InputPassword(
                      controller: _confirmPasswordController,
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
                            onPressed: () {
                              _criarConta();
                            },
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
            ),
          ),
        )
      )
    );
  }
}