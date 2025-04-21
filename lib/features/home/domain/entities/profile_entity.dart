import 'package:trust_zone/features/home/data/models/profile_model/disability_type.dart';

class ProfileEntity {
  
  final String name;
  final String email;
  final String? imageUrl;
  final List<DisabilityType>? disabilityTypes;
  ProfileEntity({required this.disabilityTypes, required this.name, required this.email, this.imageUrl});
}
