import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:flutter/material.dart';

class DialogFull extends StatelessWidget {
  const DialogFull({super.key, required this.nomeDialog, required this.forms});

  final String nomeDialog;
  final List<Widget> forms;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: AppBar(
          title: Text(nomeDialog),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close)
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(paddingPadrao),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    logo_domain,
                    width: 200,
                    height: 200,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: forms.length,
                    itemBuilder: (context, index) {
                      return forms[index];
                    },
                  ),
                  const SizedBox(height: paddingPadrao),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton.extended(
                        label: const Text('Cancelar'),
                        icon: const Icon(Icons.cancel_outlined),
                        backgroundColor: cancelColor,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FloatingActionButton.extended(
                        label: const Text('Salvar'),
                        icon: const Icon(Icons.save),
                        onPressed: () {
                          
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ),
      )
    );
  }
}