import 'package:domain_trader/constants.dart';
import 'package:domain_trader/features/domain_trader/presentation/widgets/navbar/popup_menu.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: paddingPadrao),
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: Image.asset(logo),
                    ),
                  ),
                  const Text(
                    'Domain Trader',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              const PopupMenu(),
            ],
          ),
        ),
      )
    );
  }
}