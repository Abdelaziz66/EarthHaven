class PlantInfoEntity {
  final String? images;
  final String? name;
  final double? probability;
  final String? description;
  final String? bestLightCondition;
  final String? bestSoilType;
  final String? commonUses;
  final String? culturalSignificance;
  final String? toxicity;
  final String? bestWatering;

  PlantInfoEntity(
      {required this.images,
        required  this.name,
        required  this.probability,
        required  this.description,
        required  this.bestLightCondition,
        required  this.bestSoilType,
        required   this.commonUses,
        required   this.culturalSignificance,
        required   this.toxicity,
        required  this.bestWatering});
}
