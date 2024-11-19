import 'package:domain_trader/features/users/presentation/widgets/input_password.dart';
import 'package:domain_trader/features/users/presentation/widgets/input_text.dart';
import 'package:domain_trader/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
              const InputText(prefixIcon: Icon(Icons.person), hintText: 'Ex: Jorge Amado', typeText: 'nome', labelText: 'Nome do Usuário'),
              const InputText(prefixIcon: Icon(Icons.email_rounded), hintText: 'Ex: jorge.amado@gmail.com', typeText: 'email', labelText: 'E-mail'), 
              const InputPassword(hintText: ''),
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
                      child: const Text('Entrar na Conta'),
                    ),
                    FilledButton(
                      onPressed: () {
                        voltarIgnorando(context, ['/login', '/cadastro'], navigatorObserver);
                      },
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.red)
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
        )
      )
    );
  }
}