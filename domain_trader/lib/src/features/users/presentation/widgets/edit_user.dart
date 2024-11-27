import 'package:domain_trader/src/dialog_full.dart';
import 'package:domain_trader/src/features/core/constants/constants.dart';
import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/users/data/models/user_model.dart';
import 'package:domain_trader/src/features/users/data/repositories/user_repository_impl.dart';
import 'package:domain_trader/src/features/users/presentation/widgets/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditUser extends ConsumerStatefulWidget {
  const EditUser({super.key});

  @override
  ConsumerState<EditUser> createState() => _EditUserState();
}

class _EditUserState extends ConsumerState<EditUser> {
  String? userName;
  String? tell;

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _tellController = TextEditingController();

  Future<void> _checarUsuario() async {
    final userRepository = UserRepositoryImpl(supabase: ref.read(supabaseProvider));
    final User? user = ref.read(supabaseProvider).auth.currentUser;

    final UserModel userModel = await userRepository.findUserbyId(user);

    setState(() {
      userName = userModel.nome;
      tell = userModel.tell;

      _nameController.text = userName ?? '';
      _tellController.text = tell ?? '';
    });
  }

  Future<void> _atualizarDados() async {
    if (_formKey.currentState?.validate() ?? false) {
      final userRepository = UserRepositoryImpl(supabase: ref.read(supabaseProvider));
      final User? user = ref.read(supabaseProvider).auth.currentUser;

      await userRepository.updateUserbyId(user, _nameController.text, _tellController.text);

      if (mounted) {
        Navigator.of(context).pushNamed('/home');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário modificado')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _checarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return DialogFull(
      formKey: _formKey,
      nomeDialog: 'Edição do Usuário',
      image: logo_login,
      forms: [
        Column(
          children: [
            Text(
              'Digite nos campos que deseja atualizar os dados',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            InputText(
              controller: _nameController,
              prefixIcon: const Icon(Icons.person),
              hintText: 'Jorge Amado', 
              typeText: 'nome',
              labelText: 'Nome do usuário'
            ),
            InputText(
              controller: _tellController,
              prefixIcon: const Icon(Icons.phone), 
              hintText: '+55 (19) 97524-5417', 
              typeText: 'tell', 
              labelText: 'Telefone',
            ),
          ],
        ),
      ],
      floatingActionButton: () {
        _atualizarDados();
      },
    );
  }
}