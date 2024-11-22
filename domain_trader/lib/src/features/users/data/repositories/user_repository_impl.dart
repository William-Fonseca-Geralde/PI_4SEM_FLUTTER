import 'package:domain_trader/src/features/users/data/models/user_model.dart';
import 'package:domain_trader/src/features/users/domain/repositories/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepositoryImpl implements UserRepository {
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Future<void> createUser(UserModel user) async {
    final response = await supabase.from('usuario').insert(user.toJson());

    if (response.error != null) {
      throw ('Erro ao adicionar os dados: ${response.error!.message}');
    }
  }  
}