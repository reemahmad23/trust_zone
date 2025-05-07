import 'package:trust_zone/features/home/domain/entities/category_entity.dart';

class CategoryModel {
  final int id;
  final String name;

  CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }


  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
