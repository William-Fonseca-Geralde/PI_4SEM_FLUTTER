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
  Future<void> createUser(UserModel user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserbyId(int id) {
    // TODO: implement updateUserbyId
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(UserModel user) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> findUserbyId(int id) {
    // TODO: implement findUserbyId
    throw UnimplementedError();
  }
}

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepositoryImpl(supabase: ref.watch(supabaseProvider));
}