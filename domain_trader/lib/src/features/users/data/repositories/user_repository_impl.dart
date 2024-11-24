import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/users/data/models/user_model.dart';
import 'package:domain_trader/src/features/users/domain/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_repository_impl.g.dart';

class UserRepositoryImpl implements UserRepository {
  final SupabaseClient supabase;

  UserRepositoryImpl({required this.supabase});

  @override
  Future<void> createUser(UserModel usuario) async {
    final AuthResponse resp = await supabase.auth
      .signUp(email: usuario.email, password: usuario.senha);
    // final Session? session = resp.session;
    final User? user = resp.user;

    await supabase
      .from('usuario')
      .insert({
        'supabase_id': user?.id,
        'nome': usuario.nome,
        'senha': usuario.senha,
        'email': usuario.email,
        'telefone': usuario.tell,
      });
  }

  @override
  Future<void> updateUserbyId(User? user, String? nome, String? email, String? tell) async {
    if (user != null) {
      await supabase
        .from('usuario')
        .update({
          'nome': nome,
          'email': email,
          'telefone': tell
        })
        .eq('supabase_id', user.id);
    }
  }

  @override
  Future<AuthResponse> loginUser(String email, String senha) async {
    final data = await supabase
      .from('usuario')
      .select()
      .eq('senha', senha)
      .eq('email', email)
      .single();

    final AuthResponse resp = await supabase.auth
      .signInWithPassword(
        email: data['email'],
        password: data['senha']
      );

    return resp;
  }

  @override
  Future<UserModel> findUserbyId(User? user) async {
    final UserModel userModel;

    if (user != null) {
      final data = await supabase
        .from('usuario')
        .select()
        .eq('supabase_id', user.id)
        .single();

      userModel = UserModel(
        nome: data['nome'],
        senha: data['senha'],
        email: data['email'],
        tell: data['telefone']
      );
    } else {
      userModel = UserModel(nome: '', senha: '', email: '', tell: '');
    }
    return userModel;
  }
}

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepositoryImpl(supabase: ref.watch(supabaseProvider));
}
