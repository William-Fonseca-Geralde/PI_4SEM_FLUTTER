import 'package:domain_trader/src/features/users/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserRepository {
  Future<void> createUser(UserModel usuario);
  Future<void> updateUserbyId(User user, String nome, String tell);
  Future<AuthResponse> loginUser(String email, String senha);
  Future<UserModel> findUserbyId(User? user);
}