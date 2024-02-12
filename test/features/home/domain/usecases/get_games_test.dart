import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:dartz/dartz.dart';
import 'package:very_good_starter_app/common/domain/failures/failure.dart';
import 'package:very_good_starter_app/features/home/domain/entities/game_entity.dart';
import 'package:very_good_starter_app/features/home/domain/repositories/game_repository.dart';
import 'package:very_good_starter_app/features/home/domain/usecases/get_games.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  late GetGames usecase;
  late MockGameRepository mockGameRepository;

  setUp(() {
    mockGameRepository = MockGameRepository();
    usecase = GetGames(mockGameRepository);
  });

  final tGamesList = [
    GameEntity(id: 1, name: "Game 1"),
    GameEntity(id: 2, name: "Game 2")
  ];
  final tParams = GetGamesParams(
    dates: '2023-12-01,2024-02-10',
    ordering: '-released',
    page: '1',
    pageSize: '20',
    platforms: '187',
  );

  test('should get games from the repository', () async {
    // arrange
    when(() => mockGameRepository.getGames(
          dates: any(named: 'dates'),
          ordering: any(named: 'ordering'),
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
          platforms: any(named: 'platforms'),
        )).thenAnswer((_) async => Right(tGamesList));

    // act
    final result = await usecase(tParams);

    // assert
    expect(result, Right<Failure, List<GameEntity>>(tGamesList));
    verify(() => mockGameRepository.getGames(
          dates: tParams.dates,
          ordering: tParams.ordering,
          page: tParams.page,
          pageSize: tParams.pageSize,
          platforms: tParams.platforms,
        ));
    verifyNoMoreInteractions(mockGameRepository);
  });
}
