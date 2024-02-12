import 'package:test/test.dart';
import 'package:very_good_starter_app/features/home/data/models/game_model.dart';
import 'package:very_good_starter_app/features/home/domain/entities/game_entity.dart';
import 'package:very_good_starter_app/features/home/domain/mappers/game_mapper.dart';

void main() {
  group('GameModelMapper', () {
    test('toDomain should return a valid GameEntity object', () {
      final gameModel = GameModel(
        slug: "helldivers-ii",
        name: "Helldivers II",
        playtime: 0,
        platforms: [
          Platform(platform: PlatformDetails(id: 4, name: "PC", slug: "pc")),
          Platform(
              platform: PlatformDetails(
                  id: 187, name: "PlayStation 5", slug: "playstation5")),
        ],
        stores: [
          Store(
            store: StoreDetails(id: 1, name: "Steam", slug: "steam"),
          ),
          Store(
              store: StoreDetails(
                  id: 3, name: "PlayStation Store", slug: "playstation-store")),
        ],
        released: "2024-02-08",
        tba: false,
        backgroundImage:
            "https://media.rawg.io/media/games/cbb/cbb9480547e9770383e3af1ab9dd3be3.jpg",
        rating: 0.0,
        ratingTop: 0,
        ratings: [
          Rating(id: 5, title: "exceptional", count: 2, percent: 66.67),
          Rating(id: 3, title: "meh", count: 1, percent: 33.33),
        ],
        ratingsCount: 2,
        reviewsTextCount: 1,
        added: 55,
        addedByStatus: AddedByStatus(
          yet: 10,
          owned: 9,
        ),
        metacritic: null,
        suggestionsCount: 302,
        updated: "2024-02-10T18:13:57",
        id: 961204,
        score: null,
        clip: null,
        tags: [],
        reviewsCount: 3,
        communityRating: 0,
        saturatedColor: "0f0f0f",
        dominantColor: "0f0f0f",
        shortScreenshots: [
          ShortScreenshot(
            id: -1,
            image:
                "https://media.rawg.io/media/games/cbb/cbb9480547e9770383e3af1ab9dd3be3.jpg",
          ),
          ShortScreenshot(
            id: 3888356,
            image:
                "https://media.rawg.io/media/screenshots/842/8425a3fde98fbabc0e7d9179c33b62af.jpg",
          ),
          ShortScreenshot(
            id: 3888357,
            image:
                "https://media.rawg.io/media/screenshots/4c8/4c8f360c605d3e50953b9d42c81f258b.jpg",
          ),
          ShortScreenshot(
            id: 3888358,
            image:
                "https://media.rawg.io/media/screenshots/3fd/3fd75b889748e77a345bdd46c7051740.jpg",
          ),
          ShortScreenshot(
            id: 3888359,
            image:
                "https://media.rawg.io/media/screenshots/aec/aecf3d7f5f20ad03f24b04929354b90e.jpg",
          ),
          ShortScreenshot(
            id: 3888360,
            image:
                "https://media.rawg.io/media/screenshots/420/4201d03a706fd321999956d529bcc376.jpg",
          ),
        ],
        parentPlatforms: [
          ParentPlatform(
              platform: PlatformDetails(id: 1, name: "PC", slug: "pc")),
          ParentPlatform(
              platform: PlatformDetails(
                  id: 2, name: "PlayStation", slug: "playstation")),
        ],
        genres: [
          Genre(id: 4, name: "Action", slug: "action"),
        ],
      );

      final gameEntity = gameModel.toDomain();

      expect(gameEntity, isA<GameEntity>());
      // Add additional assertions here based on the expected GameEntity object
    });
  });

  group('PlatformMapper', () {
    test('toDomain should return a valid PlatformEntity object', () {
      final data = Platform(
          platform: PlatformDetails(
              id: 187, name: "PlayStation 5", slug: "playstation5"));

      final platformEntity = data.toDomain();

      expect(platformEntity, isA<PlatformEntity>());
      // Add additional assertions here based on the expected PlatformEntity object
    });
  });

  group('StoreMapper', () {
    test('toDomain should return a valid StoreEntity object', () {
      final data =
          Store(store: StoreDetails(id: 1, name: "Steam", slug: "steam"));

      final storeEntity = data.toDomain();

      expect(storeEntity, isA<StoreEntity>());
    });
  });

  group('RatingMapper', () {
    test('toDomain should return a valid RatingEntity object', () {
      final data =
          Rating(id: 5, title: "exceptional", count: 2, percent: 66.67);

      final ratingEntity = data.toDomain();

      expect(ratingEntity, isA<RatingEntity>());
    });
  });

  group('AddedByStatusMapper', () {
    test('toDomain should return a valid AddedByStatusEntity object', () {
      final data = AddedByStatus(
        yet: 10,
        owned: 9,
      );

      final addedByStatusEntity = data.toDomain();

      expect(addedByStatusEntity, isA<AddedByStatusEntity>());
    });
  });

  group('TagMapper', () {
    test('toDomain should return a valid TagEntity object', () {
      final data = Tag(name: 'tag name');

      final tagEntity = data.toDomain();

      expect(tagEntity, isA<TagEntity>());
    });
  });

  group('ShortScreenshotMapper', () {
    test('toDomain should return a valid ShortScreenshotEntity object', () {
      final data = ShortScreenshot(
        id: 3888357,
        image:
            "https://media.rawg.io/media/screenshots/4c8/4c8f360c605d3e50953b9d42c81f258b.jpg",
      );

      final shortScreenshotEntity = data.toDomain();

      expect(shortScreenshotEntity, isA<ShortScreenshotEntity>());
    });
  });

  group('ParentPlatformMapper', () {
    test('toDomain should return a valid ParentPlatformEntity object', () {
      final data = ParentPlatform(
          platform: PlatformDetails(id: 1, name: "PC", slug: "pc"));

      final parentPlatformEntity = data.toDomain();

      expect(parentPlatformEntity, isA<ParentPlatformEntity>());
    });
  });

  group('GenreMapper', () {
    test('toDomain should return a valid GenreEntity object', () {
      final data = Genre(id: 4, name: "Action", slug: "action");

      final genreEntity = data.toDomain();

      expect(genreEntity, isA<GenreEntity>());
    });
  });
}
