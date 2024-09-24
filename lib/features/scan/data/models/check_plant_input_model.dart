class CheckPlantInputModel {
  final List<String> images;
  final double latitude= 49.207;
  final double longitude=16.608;
  final bool similar_images=true;

  CheckPlantInputModel({required this.images});

  Map<String, dynamic> toMap() {
    return {
      'images': images,
      'latitude': latitude,
      'longitude': longitude,
      'similar_images':similar_images,
    };
}

}
