import 'package:domain_trader/src/features/leiloes/domain/repositories/leiloes_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LeiloesRepositoryImpl implements LeiloesRepositories {
  final SupabaseClient supabase;

  LeiloesRepositoryImpl({required this.supabase});

  @override
  Future<void> createLeilao() {
    // TODO: implement createLeilao
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> findLeiloesbyDomain(int? dominioId) async {
    if (dominioId != null) {
      final data = await supabase
        .from('leilao')
        .select('usuario(nome, supabase_id), valor')
        .eq('id_dominio', dominioId)
        .order('valor', ascending: false);

      final leiloes = data.map((e) {
        final usuario = e['usuario'];

        return {
          'nome': usuario['nome'] ?? "",
          'id': usuario['supabase_id'] ?? "",
          'valor': e['valor'] ?? "",
        };
      }).toList();

      return leiloes;
    } else {
      return List.empty();
    }
  }
}