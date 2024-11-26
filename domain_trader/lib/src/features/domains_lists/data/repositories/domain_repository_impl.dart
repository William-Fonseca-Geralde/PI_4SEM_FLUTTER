import 'package:domain_trader/src/features/core/providers/supabase_provider.dart';
import 'package:domain_trader/src/features/domains_lists/data/models/domain_model.dart';
import 'package:domain_trader/src/features/domains_lists/domain/repositories/domain_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'domain_repository_impl.g.dart';

class DomainRepositoryImpl implements DomainRepository {
  final SupabaseClient supabase;

  DomainRepositoryImpl({required this.supabase});

  @override
  Future<void> createDomain(DomainModel domain) async {
    await supabase
      .from('dominio')
      .insert({
        'url': domain.url,
        'preco': domain.preco,
        'data_expiracao': domain.dataExpiracao,
        'status': domain.status,
        'categoria': domain.categoria,
        'id_usuario': domain.idUser,
      });
  }

  @override
  Future<void> updateDomainbyId(int id, DateTime dataExpiracao, String status, String categoria) async {
    await supabase
      .from('dominio')
      .update({
        'data_expiracao': dataExpiracao,
        'status': status,
        'categoria': categoria,
      })
      .eq('id_dominio', id);
  }

  @override
  Future<List<Map<String, dynamic>>> findAllDomains() async {
    final data = await supabase
      .from('dominio')
      .select('*, leilao(valor)')
      .eq('status', 'disponível');

    final listDomais = data.map((e) {
      final leilao = (e['leilao'] as List<dynamic>?) ?? [];
      leilao.sort((a, b) => (b['valor']).compareTo((a['valor'])));

      return {
        'url': e['url'],
        'status': e['status'],
        'valor': leilao.isNotEmpty ? leilao.first['valor'] : e['preco']
      };
    }).toList();

    print('findAllDomain: $listDomais');

    return listDomais;
  }

  @override
  Future<List<Map<String, dynamic>>> findDomainsbyUser(User? user) async {
    if (user != null) {
      final usuario = await supabase
        .from('usuario')
        .select()
        .eq('supabase_id', user.id)
        .single();

      final data = await supabase
        .from('dominio')
        .select('url, categoria, leilao(valor, id_usuario)')
        .eq('id_usuario', usuario['id_usuario'])
        .neq('leilao.id_usuario', usuario['id_usuario']);

      final listDomais = data.map((e) {
        final leilao = (e['leilao'] as List<dynamic>?) ?? [];
        leilao.sort((a, b) => (b['valor']).compareTo((a['valor'])));

        return {
          'url': e['url'],
          'status': e['status'],
          'valor': leilao.isNotEmpty ? leilao.first['valor'] : e['preco']
        };
      }).toList();

      return listDomais;
    } else {
      return List.empty();
    }
  }

  @override
  Future<List<Map<String, dynamic>>> findDomainsbyInvest(User? user) async {
    if (user != null) {
      final dataUser = await supabase
        .from('usuario')
        .select()
        .eq('supabase_id', user.id)
        .single();

      final data = await supabase
        .from('leilao')
        .select('dominio(url, preco, data_expiracao, status, categoria), valor')
        .eq('id_usuario', dataUser['id_usuario']);

      final listDomains = data.map((e) {
        final dominio = e['dominio'];

        return {
          'url': dominio['url'] ?? '',
          'status': dominio['status'] ?? '',
          'valor': e['valor'] ?? ''
        };
      }).toList();

      print('findDomainsBy: $listDomains');

      return listDomains;
    } else {
      return List.empty();
    }
  }
}

@riverpod
DomainRepository domainRepository(Ref ref) {
  return DomainRepositoryImpl(supabase: ref.watch(supabaseProvider));
}