import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_zone/features/home/domain/use_cases/get_places.dart';
import 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  final GetBranchesByCategoryUseCase useCase;

  BranchCubit(this.useCase) : super(BranchInitial());

  void getBranches(int categoryId) async {
    emit(BranchLoading());
    try {
      final branches = await useCase(categoryId);
      emit(BranchLoaded(branches));
    } catch (e) {
      emit(BranchError(e.toString()));
    }
  }
}
