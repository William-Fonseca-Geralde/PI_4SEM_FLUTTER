import 'dart:math';

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

    await supabase.from('usuario').insert({
      'supabase_id': user?.id,
      'nome': usuario.nome,
      'senha': usuario.senha,
      'email': usuario.email,
      'telefone': usuario.tell,
    });
  }

  @override
  Future<void> updateUserbyId(int id) {
    // TODO: implement updateUserbyId
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(UserModel usuario) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<void> findUserbyId(String email, String senha) async {
    final data = await supabase.from('usuario')
      .select()
      .eq('senha', senha)
      .eq('email', email);

    final AuthResponse resp = await supabase.auth
      .signInWithPassword(
        email: data.first['email'],
        password: data.first['senha']
      );
  }
}

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepositoryImpl(supabase: ref.watch(supabaseProvider));
}
