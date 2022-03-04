import 'package:bloc/bloc.dart';
import 'package:devmeet/modules/chose/repository/chose_repository.dart';
import 'package:equatable/equatable.dart';

part 'chose_state.dart';

class ChoseCubit extends Cubit<ChoseState> {
  final ChoseRepository _choseRepository;

  ChoseCubit(this._choseRepository) : super(const ChoseState());

  void choseCategory(String category) {
    emit(state.copyWith(
      category: category,
    ));
  }
}
