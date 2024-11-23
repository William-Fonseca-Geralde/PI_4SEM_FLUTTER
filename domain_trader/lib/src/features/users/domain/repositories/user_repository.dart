import 'package:domain_trader/src/features/users/data/models/user_model.dart';

abstract class UserRepository {
  Future<void> createUser(UserModel usuario);
  Future<void> updateUserbyId(int id);
  Future<void> deleteUser(UserModel usuario);
  Future<UserModel> findUserbyId(int id);
}