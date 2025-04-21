import 'package:dartz/dartz.dart';
import 'package:trust_zone/core/errors/failure.dart';
import 'package:trust_zone/features/home/data/models/profile_model/profile_model.dart';


abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> getProfile(String token);
  Future<Either<Failure, ProfileModel>> updateProfile(String token,Map<String, dynamic> data);
}
