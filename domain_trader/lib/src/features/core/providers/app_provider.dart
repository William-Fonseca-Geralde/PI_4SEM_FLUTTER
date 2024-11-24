import 'package:domain_trader/src/features/users/data/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final brightnessProvider = StateProvider((ref) => true);

final userProvider = StateNotifierProvider<UserNotifier, UserModel?>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<UserModel?> {
  UserNotifier() : super(null);

  void setUser(UserModel user) {
    state = user;
  }

  void updateUser({String? nome, String? email, String? tell}) {
    if (state != null) {
      state = state!.copyWith(
        nome: nome ?? state!.nome,
        email: email ?? state!.email,
        tell: tell ?? state!.tell,
      );
    }
  }

  void resetUser() {
    state = null;
  }
}