part of 'chose_cubit.dart';

class ChoseState extends Equatable {
  final String? category;

  const ChoseState({
    this.category,
  });

  ChoseState copyWith({
    String? category,
  }) {
    return ChoseState(
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [
        category,
      ];
}
