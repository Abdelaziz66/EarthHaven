class PlantInfoModel {
  String? accessToken;
  String? modelVersion;
  dynamic customId;
  Input? input;
  Result? result;
  String? status;
  bool? slaCompliantClient;
  bool? slaCompliantSystem;
  double? created;
  double? completed;

  PlantInfoModel({
    this.accessToken,
    this.modelVersion,
    this.customId,
    this.input,
    this.result,
    this.status,
    this.slaCompliantClient,
    this.slaCompliantSystem,
    this.created,
    this.completed,
  });

  factory PlantInfoModel.fromJson(Map<String, dynamic> json) => PlantInfoModel(
    accessToken: json["access_token"],
    modelVersion: json["model_version"],
    customId: json["custom_id"],
    input: json["input"] == null ? null : Input.fromJson(json["input"]),
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
    status: json["status"],
    slaCompliantClient: json["sla_compliant_client"],
    slaCompliantSystem: json["sla_compliant_system"],
    created: json["created"]?.toDouble(),
    completed: json["completed"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "model_version": modelVersion,
    "custom_id": customId,
    "input": input?.toJson(),
    "result": result?.toJson(),
    "status": status,
    "sla_compliant_client": slaCompliantClient,
    "sla_compliant_system": slaCompliantSystem,
    "created": created,
    "completed": completed,
  };
}

class Input {
  double? latitude;
  double? longitude;
  bool? similarImages;
  List<String>? images;
  DateTime? datetime;

  Input({
    this.latitude,
    this.longitude,
    this.similarImages,
    this.images,
    this.datetime,
  });

  factory Input.fromJson(Map<String, dynamic> json) => Input(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    similarImages: json["similar_images"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    datetime: json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
    "similar_images": similarImages,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "datetime": datetime?.toIso8601String(),
  };
}

class Result {
  IsPlant? isPlant;
  Classification? classification;

  Result({
    this.isPlant,
    this.classification,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    isPlant: json["is_plant"] == null ? null : IsPlant.fromJson(json["is_plant"]),
    classification: json["classification"] == null ? null : Classification.fromJson(json["classification"]),
  );

  Map<String, dynamic> toJson() => {
    "is_plant": isPlant?.toJson(),
    "classification": classification?.toJson(),
  };
}

class Classification {
  List<Suggestion>? suggestions;

  Classification({
    this.suggestions,
  });

  factory Classification.fromJson(Map<String, dynamic> json) => Classification(
    suggestions: json["suggestions"] == null ? [] : List<Suggestion>.from(json["suggestions"]!.map((x) => Suggestion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "suggestions": suggestions == null ? [] : List<dynamic>.from(suggestions!.map((x) => x.toJson())),
  };
}

class Suggestion {
  String? id;
  String? name;
  double? probability;
  List<SimilarImage>? similarImages;
  Details? details;

  Suggestion({
    this.id,
    this.name,
    this.probability,
    this.similarImages,
    this.details,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
    id: json["id"],
    name: json["name"],
    probability: json["probability"]?.toDouble(),
    similarImages: json["similar_images"] == null ? [] : List<SimilarImage>.from(json["similar_images"]!.map((x) => SimilarImage.fromJson(x))),
    details: json["details"] == null ? null : Details.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "probability": probability,
    "similar_images": similarImages == null ? [] : List<dynamic>.from(similarImages!.map((x) => x.toJson())),
    "details": details?.toJson(),
  };
}

class Details {
  List<String>? commonNames;
  Taxonomy? taxonomy;
  String? url;
  int? gbifId;
  int? inaturalistId;
  String? rank;
  Description? description;
  List<String>? synonyms;
  Description? image;
  dynamic edibleParts;
  dynamic watering;
  String? bestLightCondition;
  String? bestSoilType;
  String? commonUses;
  String? culturalSignificance;
  String? toxicity;
  String? bestWatering;
  String? language;
  String? entityId;

  Details({
    this.commonNames,
    this.taxonomy,
    this.url,
    this.gbifId,
    this.inaturalistId,
    this.rank,
    this.description,
    this.synonyms,
    this.image,
    this.edibleParts,
    this.watering,
    this.bestLightCondition,
    this.bestSoilType,
    this.commonUses,
    this.culturalSignificance,
    this.toxicity,
    this.bestWatering,
    this.language,
    this.entityId,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    commonNames: json["common_names"] == null ? [] : List<String>.from(json["common_names"]!.map((x) => x)),
    taxonomy: json["taxonomy"] == null ? null : Taxonomy.fromJson(json["taxonomy"]),
    url: json["url"],
    gbifId: json["gbif_id"],
    inaturalistId: json["inaturalist_id"],
    rank: json["rank"],
    description: json["description"] == null ? null : Description.fromJson(json["description"]),
    synonyms: json["synonyms"] == null ? [] : List<String>.from(json["synonyms"]!.map((x) => x)),
    image: json["image"] == null ? null : Description.fromJson(json["image"]),
    edibleParts: json["edible_parts"],
    watering: json["watering"],
    bestLightCondition: json["best_light_condition"],
    bestSoilType: json["best_soil_type"],
    commonUses: json["common_uses"],
    culturalSignificance: json["cultural_significance"],
    toxicity: json["toxicity"],
    bestWatering: json["best_watering"],
    language: json["language"],
    entityId: json["entity_id"],
  );

  Map<String, dynamic> toJson() => {
    "common_names": commonNames == null ? [] : List<dynamic>.from(commonNames!.map((x) => x)),
    "taxonomy": taxonomy?.toJson(),
    "url": url,
    "gbif_id": gbifId,
    "inaturalist_id": inaturalistId,
    "rank": rank,
    "description": description?.toJson(),
    "synonyms": synonyms == null ? [] : List<dynamic>.from(synonyms!.map((x) => x)),
    "image": image?.toJson(),
    "edible_parts": edibleParts,
    "watering": watering,
    "best_light_condition": bestLightCondition,
    "best_soil_type": bestSoilType,
    "common_uses": commonUses,
    "cultural_significance": culturalSignificance,
    "toxicity": toxicity,
    "best_watering": bestWatering,
    "language": language,
    "entity_id": entityId,
  };
}

class Description {
  String? value;
  String? citation;
  String? licenseName;
  String? licenseUrl;

  Description({
    this.value,
    this.citation,
    this.licenseName,
    this.licenseUrl,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    value: json["value"],
    citation: json["citation"],
    licenseName: json["license_name"],
    licenseUrl: json["license_url"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "citation": citation,
    "license_name": licenseName,
    "license_url": licenseUrl,
  };
}

class Taxonomy {
  String? taxonomyClass;
  String? genus;
  String? order;
  String? family;
  String? phylum;
  String? kingdom;

  Taxonomy({
    this.taxonomyClass,
    this.genus,
    this.order,
    this.family,
    this.phylum,
    this.kingdom,
  });

  factory Taxonomy.fromJson(Map<String, dynamic> json) => Taxonomy(
    taxonomyClass: json["class"],
    genus: json["genus"],
    order: json["order"],
    family: json["family"],
    phylum: json["phylum"],
    kingdom: json["kingdom"],
  );

  Map<String, dynamic> toJson() => {
    "class": taxonomyClass,
    "genus": genus,
    "order": order,
    "family": family,
    "phylum": phylum,
    "kingdom": kingdom,
  };
}

class SimilarImage {
  String? id;
  String? url;
  String? licenseName;
  String? licenseUrl;
  String? citation;
  double? similarity;
  String? urlSmall;

  SimilarImage({
    this.id,
    this.url,
    this.licenseName,
    this.licenseUrl,
    this.citation,
    this.similarity,
    this.urlSmall,
  });

  factory SimilarImage.fromJson(Map<String, dynamic> json) => SimilarImage(
    id: json["id"],
    url: json["url"],
    licenseName: json["license_name"],
    licenseUrl: json["license_url"],
    citation: json["citation"],
    similarity: json["similarity"]?.toDouble(),
    urlSmall: json["url_small"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "license_name": licenseName,
    "license_url": licenseUrl,
    "citation": citation,
    "similarity": similarity,
    "url_small": urlSmall,
  };
}

class IsPlant {
  double? probability;
  double? threshold;
  bool? binary;

  IsPlant({
    this.probability,
    this.threshold,
    this.binary,
  });

  factory IsPlant.fromJson(Map<String, dynamic> json) => IsPlant(
    probability: json["probability"]?.toDouble(),
    threshold: json["threshold"]?.toDouble(),
    binary: json["binary"],
  );

  Map<String, dynamic> toJson() => {
    "probability": probability,
    "threshold": threshold,
    "binary": binary,
  };
}
