part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = StateEnum.initial,
    this.games = const [],
    this.hasReachedMax = false,
  });

  final StateEnum status;
  final List<GameEntity> games;
  final bool hasReachedMax;

  @override
  List<Object> get props => [status, games, hasReachedMax];

  HomeState copyWith({
    StateEnum? status,
    List<GameEntity>? games,
    bool? hasReachedMax,
  }) {
    return HomeState(
      status: status ?? this.status,
      games: games ?? this.games,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return 'HomeState{status: $status, games: $games, hasReachedMax: $hasReachedMax}';
  }
}
