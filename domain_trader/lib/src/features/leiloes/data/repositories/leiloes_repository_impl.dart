import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/leiloes/data/models/leilao_model.dart';
import 'package:domain_trader/src/features/leiloes/domain/repositories/leiloes_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leiloes_repository_impl.g.dart';

class LeiloesRepositoryImpl implements LeiloesRepository {
  final SupabaseClient supabase;

  LeiloesRepositoryImpl({required this.supabase});

  @override
  Future<void> createLeilao(LeilaoModel leilao) async {
    await supabase
      .from('leilao')
      .insert({
        'id_dominio': leilao.id_dominio,
        'id_usuario': leilao.id_usuario,
        'valor': leilao.valor,
      });
  }

  @override
  Future<void> updateLeilao(String valor, User? user, String url) async {
    final newValor = valor.replaceAll(RegExp(r'[^\d.]'), '');

    if (user != null) {
      final usuario = await supabase
        .from('usuario')
        .select()
        .eq('supabase_id', user.id)
        .single();

      final dominio = await supabase
        .from('dominio')
        .select()
        .eq('url', url)
        .single();

      await supabase
        .from('leilao')
        .update({
          'valor': double.parse(newValor)
        })
        .eq('id_usuario', usuario['id_usuario'])
        .eq('id_dominio', dominio['id_dominio']);
    }
  }

  @override
  Future<void> deleteLeilao(User? user, String url) async {
    if (user != null) {
      final usuario = await supabase
        .from('usuario')
        .select()
        .eq('supabase_id', user.id)
        .single();

      final dominio = await supabase
        .from('dominio')
        .select()
        .eq('url', url)
        .single();

      await supabase
        .from('leilao')
        .delete()
        .eq('id_usuario', usuario['id_usuario'])
        .eq('id_dominio', dominio['id_dominio']);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> findLeiloesbyDomain(int? dominioId) async {
    if (dominioId != null) {
      final data = await supabase
        .from('leilao')
        .select('usuario(nome, supabase_id, cpf, email, telefone), valor')
        .eq('id_dominio', dominioId)
        .order('valor', ascending: false);

      final leiloes = data.map((e) {
        final usuario = e['usuario'];

        return {
          'nome': usuario['nome'] ?? "",
          'cpf': usuario['cpf'] ?? "",
          'email': usuario['email'] ?? "",
          'id': usuario['supabase_id'] ?? "",
          'valor': e['valor'] ?? "",
          'tel': usuario['telefone'] ?? "",
        };
      }).toList();

      return leiloes;
    } else {
      return List.empty();
    }
  }
}

@riverpod
LeiloesRepository leiloesRepository(Ref ref) {
  return LeiloesRepositoryImpl(supabase: ref.watch(supabaseProvider));
}