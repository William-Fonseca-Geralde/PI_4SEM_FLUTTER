import 'package:domain_trader/src/features/domains_lists/data/models/domain_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DomainRepository {
  Future<void> createDomain(DomainModel domain);
  Future<void> updateDomainbyId(int id, DateTime dataExpiracao, String status, String categoria);
  Future<List<DomainModel>> findAllDomains();
  Future<List<Map<String, dynamic>>> findDomainsbyUser(User user);
  Future<List<DomainModel>> findDomainsbyInvest(User user);
}