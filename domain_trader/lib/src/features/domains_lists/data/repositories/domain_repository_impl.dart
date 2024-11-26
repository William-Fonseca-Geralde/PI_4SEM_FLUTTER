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
  Future<List<DomainModel>> findAllDomains() async {
    final data = await supabase
      .from('dominio')
      .select()
      .eq('status', 'disponível');

    final List<DomainModel> listDomais = List.generate(
      data.length,
      (index) => 
        DomainModel(
          url: data[index]['url'],
          idUser: data[index]['id_usuario'],
          preco: data[index]['preco'],
          dataExpiracao: data[index]['data_expiracao'],
          status: data[index]['status'],
          categoria: data[index]['categoria']
        ),
    );

    print('findAllDomain: $listDomais');

    return listDomais;
  }

  @override
  Future<List<Map<String, dynamic>>> findDomainsbyUser(User? user) async {
    if (user != null) {
      final data = await supabase
        .from('usuario')
        .select('dominio(url, preco, data_expiracao, status, categoria)')
        .eq('supabase_id', user.id);

      return List<Map<String, dynamic>>.from(data);
    } else {
      return List.empty();
    }
  }

  @override
  Future<List<DomainModel>> findDomainsbyInvest(User? user) async {
    if (user != null) {
      final dataUser = await supabase
        .from('usuario')
        .select()
        .eq('supabase_id', user.id)
        .single();

      final data = await supabase
        .from('leilao')
        .select('dominio(url, preco, data_expiracao, status, categoria)')
        .eq('id_usuario', dataUser['id_usuario']);

      final List<DomainModel> listDomains = List.generate(
        data.length,
        (index) => 
          DomainModel(
            url: data[index]['dominio']['url'],
            idUser: dataUser['id_usuario'],
            preco: data[index]['dominio']['preco'],
            dataExpiracao: data[index]['dominio']['data_expiracao'],
            status: data[index]['dominio']['status'],
            categoria: data[index]['dominio']['categoria']
          ),
      );

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