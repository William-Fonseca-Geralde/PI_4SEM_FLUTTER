import 'package:domain_trader/src/features/domains_lists/data/models/domain_model.dart';

abstract class DomainRepository {
  Future<void> createDomain(DomainModel domain);
  Future<void> updateDomainbyId(int id, DateTime dataExpiracao, String status, String categoria);
  Future<List<DomainModel>> findAllDomains();
}