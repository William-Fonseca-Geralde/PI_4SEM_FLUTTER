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
  Future<void> createUser(UserModel user) async {
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(UserModel user) {
    throw UnimplementedError();
  }
}

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepositoryImpl(supabase: ref.watch(supabaseProvider));
}