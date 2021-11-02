part of 'bottombar_cubit.dart';

class BottomBarState extends Equatable {
  int currentIndex;

  BottomBarState({
    this.currentIndex = 0,
  });

  BottomBarState copyWith({
    int? currentIndex,
  }) {
    return BottomBarState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [
        currentIndex,
      ];
}
