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
  Future<void> createDomain(DomainModel domain) {
    // TODO: implement createDomain
    throw UnimplementedError();
  }

  @override
  Future<void> updateDomainbyId(int id) {
    // TODO: implement updateDomainbyId
    throw UnimplementedError();
  }

  @override
  Future<void> deleteDomain(DomainModel domain) {
    // TODO: implement deleteDomain
    throw UnimplementedError();
  }

  @override
  Future<List<DomainModel>> findAllDomains() {
    // TODO: implement findAllDomains
    throw UnimplementedError();
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