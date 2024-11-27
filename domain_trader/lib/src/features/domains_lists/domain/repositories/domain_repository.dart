import 'package:domain_trader/src/features/domains_lists/data/models/domain_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DomainRepository {
  Future<void> createDomain(DomainModel domain);
  Future<void> updateDomainbyId(String url, String dataExpiracao, String status, String categoria);
  Future<List<Map<String, dynamic>>> findAllDomains();
  Future<List<Map<String, dynamic>>> findDomainsbyUser(User user);
  Future<List<Map<String, dynamic>>> findDomainsbyInvest(User user);
}