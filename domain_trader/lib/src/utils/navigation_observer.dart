import 'package:flutter/material.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  final List<Route<dynamic>> routeStack = [];

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    routeStack.add(route); // Adiciona a rota à pilha
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    routeStack.remove(route); // Remove a rota da pilha
  }
}