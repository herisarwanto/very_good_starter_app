import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_starter_app/common/domain/failures/failure.dart';
import 'package:very_good_starter_app/common/utils/constant.dart';
import 'package:very_good_starter_app/features/home/domain/entities/game_entity.dart';
import 'package:very_good_starter_app/features/home/domain/usecases/get_games.dart';
import 'package:very_good_starter_app/features/home/presentation/bloc/home_bloc.dart';

class MockGetGames extends Mock implements GetGames {}

void main() {
  late HomeBloc homeBloc;
  late MockGetGames mockGetGames;

  setUp(() {
    mockGetGames = MockGetGames();
    homeBloc = HomeBloc(mockGetGames);
  });

  group('GamesFetched event', () {
    final tGames = [GameEntity(id: 1, name: 'Game 1')];
    final tDataFailure = DataFailure(code: 404);
    final _pageSize = 20;

    blocTest<HomeBloc, HomeState>(
      'should emit success state when games are fetched successfully for the first time',
      build: () {
        when(() => mockGetGames.call(any()))
            .thenAnswer((_) async => Right(tGames));
        return homeBloc;
      },
      act: (bloc) => bloc.add(GamesFetched()),
      expect: () => [
        HomeState(
          status: StateEnum.success,
          games: tGames,
          hasReachedMax: tGames.length < _pageSize,
        ),
      ],
    );

    // Register fallback value for GetGamesParams
    registerFallbackValue(GetGamesParams(
      dates: '2023-12-01,2024-02-10',
      ordering: '-released',
      page: '1',
      pageSize: '20',
      platforms: '187',
    ));

    blocTest<HomeBloc, HomeState>(
      'should emit success state with hasReachedMax true when no games are fetched',
      build: () {
        when(() => mockGetGames.call(any())).thenAnswer((_) async => Right([]));
        return homeBloc;
      },
      act: (bloc) => bloc.add(GamesFetched()),
      expect: () => [
        HomeState(
          status: StateEnum.success,
          games: [],
          hasReachedMax: true,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'should emit success state with hasReachedMax true when receiving 404 DataFailure',
      build: () {
        when(() => mockGetGames.call(any()))
            .thenAnswer((_) async => Left(tDataFailure));
        return homeBloc;
      },
      act: (bloc) => bloc.add(GamesFetched()),
      expect: () => [
        HomeState(
          status: StateEnum.success,
          hasReachedMax: true,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'should emit success state with games added to existing list when games are fetched successfully subsequently',
      build: () {
        when(() => mockGetGames.call(any()))
            .thenAnswer((_) async => Right(tGames));
        return homeBloc;
      },
      seed: () => HomeState(
        status: StateEnum.success,
        games: [GameEntity(id: 2, name: 'Game 2')],
        hasReachedMax: false,
      ),
      act: (bloc) => bloc.add(GamesFetched()),
      expect: () => [
        HomeState(
          status: StateEnum.success,
          games: [GameEntity(id: 2, name: 'Game 2'), ...tGames],
          hasReachedMax: tGames.length < _pageSize,
        ),
      ],
    );
  });
}
