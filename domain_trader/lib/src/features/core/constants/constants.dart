import 'package:domain_trader/src/utils/navigation_observer.dart';
import 'package:flutter/material.dart';

const corPrimaria = Color(0xFF266BD2);
const corPrimariaClara = Color(0xFFC5EDFF);
const corPrimariaEscura = Color(0xFF90CFFF);

const logo = 'assets/imgs/logo_domaintrader.png';
const logo_login = 'assets/imgs/logo_domaintrader_login.png';
const logo_domain = 'assets/imgs/logo_domaintrader_domain.png';

const paddingPadrao = 16.0;

final navigatorObserver = CustomNavigatorObserver();

void voltarIgnorando(BuildContext context, List<String> ignorar, CustomNavigatorObserver observer) {
  while (observer.routeStack.isNotEmpty) {
    final route = observer.routeStack.last;

    if (ignorar.contains(route.settings.name)) {
      observer.routeStack.removeLast();
      Navigator.pop(context);
    } else {
      break;
    }
  }
}