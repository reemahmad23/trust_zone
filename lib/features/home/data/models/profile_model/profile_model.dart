import 'package:hive/hive.dart';
import 'package:trust_zone/features/home/domain/entities/profile_entity.dart';

import 'disability_type.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 0)

class ProfileModel extends ProfileEntity{

  @HiveField(0)
  String? id;

  @HiveField(1)
  String userName;

  @HiveField(2)
  String userEmail;

  @HiveField(3)
  int? age;

  @HiveField(4)
  dynamic profilePictureUrl;

  @HiveField(5)
  dynamic coverPictureUrl;

  @HiveField(6)
  DateTime? registrationDate;

  @HiveField(7)
  bool? isActive;

  @HiveField(8)
  List<DisabilityType>? disabilityTypes;

  ProfileModel({
    this.id,
    required this.userName,
    required this.userEmail,
    this.age,
    this.profilePictureUrl,
    this.coverPictureUrl,
    this.registrationDate,
    this.isActive,
    this.disabilityTypes, 
  }) :super(email: userEmail, name: userName, imageUrl: profilePictureUrl, disabilityTypes: disabilityTypes);

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json['id'] as String?,
    userName: json['userName'] as String,
    userEmail: json['email'] as String,
    age: json['age'] as int?,
    profilePictureUrl: json['profilePictureUrl'] as dynamic,
    coverPictureUrl: json['coverPictureUrl'] as dynamic,
    registrationDate:
        json['registrationDate'] == null
            ? null
            : DateTime.parse(json['registrationDate'] as String),
    isActive: json['isActive'] as bool?,
    disabilityTypes:
        (json['disabilityTypes'] as List<dynamic>?)
            ?.map((e) => DisabilityType.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'userName': userName,
    'email': userEmail,
    'age': age,
    'profilePictureUrl': profilePictureUrl,
    'coverPictureUrl': coverPictureUrl,
    'registrationDate': registrationDate?.toIso8601String(),
    'isActive': isActive,
    'disabilityTypes': disabilityTypes?.map((e) => e.toJson()).toList(),
  };
}
