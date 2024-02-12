import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_starter_app/common/domain/failures/failure.dart';
import 'package:very_good_starter_app/common/extensions/dartz_extension.dart';
import 'package:very_good_starter_app/features/home/data/datasource/remote/game_remote_data_source.dart';
import 'package:very_good_starter_app/features/home/data/models/game_model.dart';
import 'package:very_good_starter_app/features/home/data/repositories/game_repository_impl.dart';
import 'package:very_good_starter_app/features/home/domain/mappers/game_mapper.dart';

class MockGameRemoteDataSource extends Mock implements GameRemoteDataSource {}

void main() {
  late GameRepositoryImpl repository;
  late MockGameRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockGameRemoteDataSource();
    repository = GameRepositoryImpl(mockDataSource);
  });

  group('getGames', () {
    final mockDates = '2023-12-01,2024-02-10';
    final mockOrdering = '-released';
    final mockPage = '1';
    final mockPageSize = '20';
    final mockPlatforms = '187';
    final mockGameModelList = [
      GameModel(
        slug: 'mock_slug',
        name: 'Mock Game',
        playtime: 0,
        platforms: [],
        stores: [],
        released: '2023-01-01',
        tba: false,
        backgroundImage: 'mock_image_url',
        rating: 0.0,
        ratingTop: 0,
        ratings: [],
        ratingsCount: 0,
        reviewsTextCount: 0,
        added: 0,
        addedByStatus: null,
        metacritic: null,
        suggestionsCount: 0,
        updated: '',
        id: 0,
        score: null,
        clip: null,
        tags: [],
        reviewsCount: 0,
        communityRating: 0,
        saturatedColor: 'mock_color',
        dominantColor: 'mock_color',
        shortScreenshots: [],
        parentPlatforms: [],
        genres: [],
      ),
    ];
    final mockGameEntityList =
        mockGameModelList.map((e) => e.toDomain()).toList();

    test('should forward the call to the data source', () async {
      // Arrange
      when(() => mockDataSource.getGames(
            dates: mockDates,
            ordering: mockOrdering,
            page: mockPage,
            pageSize: mockPageSize,
            platforms: mockPlatforms,
          )).thenAnswer((_) async => Right(mockGameModelList));

      // Act
      final result = await repository.getGames(
        dates: mockDates,
        ordering: mockOrdering,
        page: mockPage,
        pageSize: mockPageSize,
        platforms: mockPlatforms,
      );

      final resultList = result.getOrElse(() => []);

      // Assert
      expect(resultList, mockGameEntityList);
      verify(() => mockDataSource.getGames(
            dates: mockDates,
            ordering: mockOrdering,
            page: mockPage,
            pageSize: mockPageSize,
            platforms: mockPlatforms,
          ));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return a failure when data source call fails', () async {
      // Arrange
      final failure = DataFailure(); // Or any other failure you want to test
      when(() => mockDataSource.getGames(
            dates: mockDates,
            ordering: mockOrdering,
            page: mockPage,
            pageSize: mockPageSize,
            platforms: mockPlatforms,
          )).thenAnswer((_) async => Left(failure));

      // Act
      final result = await repository.getGames(
        dates: mockDates,
        ordering: mockOrdering,
        page: mockPage,
        pageSize: mockPageSize,
        platforms: mockPlatforms,
      );

      final resultList = result.getLeft();
      // Assert
      expect(resultList, failure);
      verify(() => mockDataSource.getGames(
            dates: mockDates,
            ordering: mockOrdering,
            page: mockPage,
            pageSize: mockPageSize,
            platforms: mockPlatforms,
          ));
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
