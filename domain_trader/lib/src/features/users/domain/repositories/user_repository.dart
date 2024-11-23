import 'package:domain_trader/src/features/users/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserRepository {
  Future<void> createUser(UserModel usuario);
  Future<void> updateUserbyId(int id);
  Future<void> deleteUser(UserModel usuario);
  Future<AuthResponse> loginUser(String email, String senha);
  Future<UserModel> findUserbyId(String? id);
}