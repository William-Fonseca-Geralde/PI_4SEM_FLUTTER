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

    return listDomais;
  }

  @override
  Future<List<DomainModel>> findDetailsDomains(int id) {
    // TODO: implement findDetailsDomains
    throw UnimplementedError();
  }
}

@riverpod
DomainRepository domainRepository(Ref ref) {
  return DomainRepositoryImpl(supabase: ref.watch(supabaseProvider));
}