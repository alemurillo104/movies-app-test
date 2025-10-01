import '../../domain/entities/production_company.entity.dart';

class ProductionCompanyModel extends ProductionCompanyEntity {
  const ProductionCompanyModel({
    required super.id,
    required super.name,
    super.logoPath,
    required super.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: json['id'] as int,
      name: json['name'] as String,
      logoPath: json['logo_path'] as String?,
      originCountry: json['origin_country'] as String,
    );
  }
}
