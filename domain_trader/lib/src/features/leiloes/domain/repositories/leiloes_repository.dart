import 'package:domain_trader/src/features/leiloes/data/models/leilao_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class LeiloesRepository {
  Future<List<Map<String, dynamic>>> findLeiloesbyDomain(int? dominioId);
  Future<void> createLeilao(LeilaoModel leilao);
  Future<void> deleteLeilao(User? user, String url);
  Future<void> updateLeilao(String valor, User? user, String url);
}