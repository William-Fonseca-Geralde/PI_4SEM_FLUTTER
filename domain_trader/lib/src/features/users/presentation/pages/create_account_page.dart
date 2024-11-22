import 'package:domain_trader/src/features/users/presentation/widgets/input_password.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_text.dart';
import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
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
                  'Cadastro',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24
                  ),
                ),
              ),
              const InputText(prefixIcon: Icon(Icons.person), hintText: 'Ex: Jorge Amado', typeText: 'nome', labelText: 'Nome do Usuário'),
              const InputText(prefixIcon: Icon(Icons.email_rounded), hintText: 'Ex: jorge.amado@gmail.com', typeText: 'email', labelText: 'E-mail'),
              const InputText(prefixIcon: Icon(Icons.phone), hintText: 'Ex: +55 (19) 97524-5417', typeText: 'tell', labelText: 'Telefone',),
              const InputPassword(hintText: ''),
              const InputPassword(hintText: '',),
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
        )
      )
    );
  }
}