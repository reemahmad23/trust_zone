import 'package:trust_zone/features/home/domain/entities/category_entity.dart';
import 'package:trust_zone/features/home/presentation/manager/category_cubit/category_state.dart';

class SingleCategoryLoaded extends CategoryState {
  final Category category;

  SingleCategoryLoaded(this.category);
}
