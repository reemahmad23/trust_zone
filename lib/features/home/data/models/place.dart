class FeatureModel {
  final int featureId;
  final String featureName;
  final String description;

  FeatureModel({required this.featureId, required this.featureName, required this.description});

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      featureId: json['featureId'],
      featureName: json['featureName'],
      description: json['description'],
    );
  }
}

class PlaceModel {
  final String name;
  final int categoryId;
  final double latitude;
  final double longitude;
  final String details;
  final List<FeatureModel> features;

  PlaceModel({
    required this.name,
    required this.categoryId,
    required this.latitude,
    required this.longitude,
    required this.details,
    required this.features,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      name: json['name'],
      categoryId: json['categoryId'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      details: json['details'],
      features: (json['features'] as List)
          .map((feature) => FeatureModel.fromJson(feature))
          .toList(),
    );
  }
}

class BranchModel {
  final int id;
  final String address;
  final String website;
  final String phone;
  final String createdAt;
  final PlaceModel place;

  BranchModel({
    required this.id,
    required this.address,
    required this.website,
    required this.phone,
    required this.createdAt,
    required this.place,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      id: json['id'],
      address: json['address'],
      website: json['website'],
      phone: json['phone'],
      createdAt: json['createdAt'],
      place: PlaceModel.fromJson(json['place']),
    );
  }
}
