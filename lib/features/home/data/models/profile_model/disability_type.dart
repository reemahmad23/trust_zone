import 'package:hive/hive.dart';

part 'disability_type.g.dart';

@HiveType(typeId: 0)
class DisabilityType {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  DisabilityType({required this.id, required this.name});

  factory DisabilityType.fromJson(Map<String, dynamic> json) =>
      DisabilityType(id: json['id'], name: json['name']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
