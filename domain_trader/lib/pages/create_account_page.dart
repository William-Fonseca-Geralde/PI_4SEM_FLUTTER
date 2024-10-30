import 'package:domain_trader/components/input_password.dart';
import 'package:domain_trader/components/input_text.dart';
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
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            InputText(prefixIcon: Icon(Icons.person), hintText: 'Digite seu nome'),
            InputText(prefixIcon: Icon(Icons.email_rounded), hintText: 'digite seu e-mail'), 
            InputPassword(),
            Padding(
              padding: EdgeInsets.all(paddingPadrao),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: corPrimariaClara,
                      thickness: 2,
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: paddingPadrao),
                    child: Text(
                      'ou',
                      style: TextStyle(
                        color: corPrimariaClara,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: corPrimariaClara,
                      thickness: 2,
                    )
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}