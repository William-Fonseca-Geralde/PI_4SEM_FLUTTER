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
    });
  }

  void _onPressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
    // Future.delayed(const Duration(milliseconds: 200), () {
    //   setState(() {
    //     _isPressed = false;
    //   });
    // });
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
            _onPressed();
            if (value == 1) {
              
            } else if (value == 2) {
              
            } else if (value == 3) {
        
            }
          },
          onCanceled: () {
            _toggleMenu();
            _onPressed();
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: Text('Meus Domínios')
            ),
            const PopupMenuItem(
              value: 2,
              child: Text('Opções')
            ),
            const PopupMenuDivider(),
            const PopupMenuItem(
              value: 1,
              child: Text('Entrar')
            ),
          ],
          onOpened: () {
            _toggleMenu();
            _onPressed();
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