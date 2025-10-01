class ProductionCompanyEntity {
  final int id;
  final String name;
  final String? logoPath;
  final String originCountry;

  const ProductionCompanyEntity({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });
}
