import 'package:domain_trader/features/pages/widgets/input_password.dart';
import 'package:domain_trader/features/pages/widgets/input_text.dart';
import 'package:domain_trader/constants.dart';
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
              const InputText(prefixIcon: Icon(Icons.person), hintText: 'Digite seu nome', typeText: 'nome'),
              const InputText(prefixIcon: Icon(Icons.email_rounded), hintText: 'Digite seu e-mail', typeText: 'email'),
              const InputText(prefixIcon: Icon(Icons.phone), hintText: 'Digite seu Telefone Ex: +55 (19) 97524-5417', typeText: 'tell'),
              const InputPassword(hintText: 'Digite sua senha'),
              const InputPassword(hintText: 'Digite a senha novamente',),
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
                        Navigator.of(context).pushNamed('/home');
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
                    const Text('Já tem conta cadastrada?'),
                    FilledButton.tonal(
                      onPressed: () {},
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