import 'package:flutter/material.dart';

class PopupMenu extends StatefulWidget {
  const PopupMenu({super.key});

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  final GlobalKey _menuKey = GlobalKey();
  bool _isMenuOpen = false;
  bool _isPressed = false;
  bool _isHovered = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          color: _isPressed 
            ? Colors.blueGrey.withOpacity(0.2)
            : _isHovered
              ? Colors.blueGrey.withOpacity(0.1)
              : Colors.transparent,
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: PopupMenuButton<int>(
          key: _menuKey,
          offset: const Offset(0, 50),
          onSelected: (value) {
            _toggleMenu();
            if (value == 1) {
              Navigator.of(context).pushNamed('/my_domains');
            } else if (value == 2) {
              Navigator.of(context).pushNamed('/settings');
            } else if (value == 3) {
              Navigator.of(context).pushNamed('/login');
            }
          },
          onCanceled: () {
            _toggleMenu();
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: Text('Meus Domínios')
            ),
            const PopupMenuItem(
              value: 2,
              child: Text('Configurações')
            ),
            const PopupMenuDivider(),
            const PopupMenuItem(
              value: 3,
              child: Text('Entrar')
            ),
          ],
          onOpened: () {
            _toggleMenu();
          },
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.person),
                const SizedBox(width: 4),
                AnimatedRotation(
                  turns: _isMenuOpen ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(Icons.keyboard_arrow_down_outlined)
                )
              ],
            )
          ),
        )
      ),
    );
  }
}