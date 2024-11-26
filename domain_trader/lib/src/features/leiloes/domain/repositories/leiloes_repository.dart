abstract class LeiloesRepositories {
  Future<void> createLeilao();
  Future<List<Map<String, dynamic>>> findLeiloesbyDomain(int? dominioId);
}