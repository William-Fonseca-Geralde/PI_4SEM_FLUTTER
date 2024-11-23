import 'package:domain_trader/src/features/domains_lists/data/models/domain_model.dart';

abstract class DomainRepository {
  Future<void> createDomain(DomainModel domain);
  Future<void> updateDomainbyId(int id);
  Future<void> deleteDomain(DomainModel domain);
  Future<List<DomainModel>> findAllDomains();
  Future<List<DomainModel>> findDetailsDomains(int id);
}