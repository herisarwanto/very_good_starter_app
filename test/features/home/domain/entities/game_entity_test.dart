import 'package:test/test.dart';
import 'package:very_good_starter_app/features/home/domain/entities/game_entity.dart';

void main() {
  group('GameEntity', () {
    test('fromJson should return a valid GameEntity object', () {
      final jsonMap = {
        "id": 1,
        "slug": "mock_slug",
        "name": "Mock Game",
        "playtime": 0,
        "platforms": [],
        "stores": [],
        "released": "2023-01-01",
        "tba": false,
        "backgroundImage": "mock_image_url",
        "rating": 0.0,
        "ratingTop": 0,
        "ratings": [],
        "ratingsCount": 0,
        "reviewsTextCount": 0,
        "added": 0,
        "addedByStatus": null,
        "suggestionsCount": 0,
        "updated": null,
        "score": 0.0,
        "clip": null,
        "tags": [],
        "metacritic": null,
        "reviewsCount": 0,
        "communityRating": 0,
        "saturatedColor": "mock_color",
        "dominantColor": "mock_color",
        "shortScreenshots": [],
        "parentPlatforms": [],
        "genres": [],
      };

      final gameEntity = GameEntity.fromJson(jsonMap);

      expect(gameEntity.id, equals(1));
      expect(gameEntity.slug, equals("mock_slug"));
      expect(gameEntity.name, equals("Mock Game"));
      expect(gameEntity.playtime, equals(0));
      expect(gameEntity.released, equals("2023-01-01"));
      expect(gameEntity.tba, isFalse);
      expect(gameEntity.backgroundImage, equals("mock_image_url"));
      expect(gameEntity.rating, equals(0.0));
      expect(gameEntity.ratingTop, equals(0));
      expect(gameEntity.ratings, isEmpty);
      expect(gameEntity.ratingsCount, equals(0));
      expect(gameEntity.reviewsTextCount, equals(0));
      expect(gameEntity.added, equals(0));
      expect(gameEntity.addedByStatus, isNull);
      expect(gameEntity.suggestionsCount, equals(0));
      expect(gameEntity.updated, isNull);
      expect(gameEntity.score, equals(0.0));
      expect(gameEntity.clip, isNull);
      expect(gameEntity.tags, isEmpty);
      expect(gameEntity.metacritic, isNull);
      expect(gameEntity.reviewsCount, equals(0));
      expect(gameEntity.communityRating, equals(0));
      expect(gameEntity.saturatedColor, equals("mock_color"));
      expect(gameEntity.dominantColor, equals("mock_color"));
      expect(gameEntity.shortScreenshots, isEmpty);
      expect(gameEntity.parentPlatforms, isEmpty);
      expect(gameEntity.genres, isEmpty);
    });

    test('toJson should return a valid JSON map', () {
      final gameEntity = GameEntity(
        id: 1,
        slug: "mock_slug",
        name: "Mock Game",
        playtime: 0,
        platforms: [],
        stores: [],
        released: "2023-01-01",
        tba: false,
        backgroundImage: "mock_image_url",
        rating: 0.0,
        ratingTop: 0,
        ratings: [],
        ratingsCount: 0,
        reviewsTextCount: 0,
        added: 0,
        addedByStatus: null,
        suggestionsCount: 0,
        updated: null,
        score: 0.0,
        clip: null,
        tags: [],
        metacritic: null,
        reviewsCount: 0,
        communityRating: 0,
        saturatedColor: "mock_color",
        dominantColor: "mock_color",
        shortScreenshots: [],
        parentPlatforms: [],
        genres: [],
      );

      final jsonMap = gameEntity.toJson();

      expect(jsonMap['id'], equals(1));
      expect(jsonMap['slug'], equals("mock_slug"));
      expect(jsonMap['name'], equals("Mock Game"));
      expect(jsonMap['playtime'], equals(0));
      expect(jsonMap['released'], equals("2023-01-01"));
      expect(jsonMap['tba'], isFalse);
      expect(jsonMap['backgroundImage'], equals("mock_image_url"));
      expect(jsonMap['rating'], equals(0.0));
      expect(jsonMap['ratingTop'], equals(0));
      expect(jsonMap['ratings'], isEmpty);
      expect(jsonMap['ratingsCount'], equals(0));
      expect(jsonMap['reviewsTextCount'], equals(0));
      expect(jsonMap['added'], equals(0));
      expect(jsonMap['addedByStatus'], isNull);
      expect(jsonMap['suggestionsCount'], equals(0));
      expect(jsonMap['updated'], isNull);
      expect(jsonMap['score'], equals(0.0));
      expect(jsonMap['clip'], isNull);
      expect(jsonMap['tags'], isEmpty);
      expect(jsonMap['metacritic'], isNull);
      expect(jsonMap['reviewsCount'], equals(0));
      expect(jsonMap['communityRating'], equals(0));
      expect(jsonMap['saturatedColor'], equals("mock_color"));
      expect(jsonMap['dominantColor'], equals("mock_color"));
      expect(jsonMap['shortScreenshots'], isEmpty);
      expect(jsonMap['parentPlatforms'], isEmpty);
      expect(jsonMap['genres'], isEmpty);
    });
  });

  group('PlatformEntity', () {
    test('fromJson should return a valid PlatformEntity object', () {
      final jsonMap = {
        "platform": {
          "id": 1,
          "name": "Mock Platform",
          "slug": "mock_platform_slug",
        }
      };

      final platformEntity = PlatformEntity.fromJson(jsonMap);

      expect(platformEntity.platform!.id, equals(1));
      expect(platformEntity.platform!.name, equals("Mock Platform"));
      expect(platformEntity.platform!.slug, equals("mock_platform_slug"));
    });

    test('toJson should return a valid JSON map', () {
      final platformDetailsEntity = PlatformDetailsEntity(
        id: 1,
        name: "Mock Platform",
        slug: "mock_platform_slug",
      );

      final platformEntity = PlatformEntity(
        platform: platformDetailsEntity,
      );

      final jsonMap = platformEntity.toJson();

      expect(jsonMap['platform'].id, equals(1));
      expect(jsonMap['platform'].name, equals("Mock Platform"));
      expect(jsonMap['platform'].slug, equals("mock_platform_slug"));
    });
  });

  group('StoreEntity', () {
    test('fromJson should return a valid StoreEntity object', () {
      final jsonMap = {
        "store": {
          "id": 1,
          "name": "Mock Store",
          "slug": "mock_store_slug",
        }
      };

      final storeEntity = StoreEntity.fromJson(jsonMap);

      expect(storeEntity.store!.id, equals(1));
      expect(storeEntity.store!.name, equals("Mock Store"));
      expect(storeEntity.store!.slug, equals("mock_store_slug"));
    });

    test('toJson should return a valid JSON map', () {
      final storeDetailsEntity = StoreDetailsEntity(
        id: 1,
        name: "Mock Store",
        slug: "mock_store_slug",
      );

      final storeEntity = StoreEntity(
        store: storeDetailsEntity,
      );

      final jsonMap = storeEntity.toJson();

      expect(storeEntity.store!.id, equals(1));
      expect(storeEntity.store!.name, equals("Mock Store"));
      expect(storeEntity.store!.slug, equals("mock_store_slug"));
    });
  });

  group('RatingEntity', () {
    test('fromJson should return a valid RatingEntity object', () {
      final jsonMap = {
        "id": 1,
        "title": "Mock Rating",
        "count": 10,
        "percent": 50.0,
      };

      final ratingEntity = RatingEntity.fromJson(jsonMap);

      expect(ratingEntity.id, equals(1));
      expect(ratingEntity.title, equals("Mock Rating"));
      expect(ratingEntity.count, equals(10));
      expect(ratingEntity.percent, equals(50.0));
    });

    test('toJson should return a valid JSON map', () {
      final ratingEntity = RatingEntity(
        id: 1,
        title: "Mock Rating",
        count: 10,
        percent: 50.0,
      );

      final jsonMap = ratingEntity.toJson();

      expect(jsonMap['id'], equals(1));
      expect(jsonMap['title'], equals("Mock Rating"));
      expect(jsonMap['count'], equals(10));
      expect(jsonMap['percent'], equals(50.0));
    });
  });

  group('AddedByStatusEntity', () {
    test('fromJson should return a valid AddedByStatusEntity object', () {
      final jsonMap = {
        "yet": 1,
        "owned": 2,
        "beaten": 3,
        "toPlay": 4,
      };

      final addedByStatusEntity = AddedByStatusEntity.fromJson(jsonMap);

      expect(addedByStatusEntity.yet, equals(1));
      expect(addedByStatusEntity.owned, equals(2));
      expect(addedByStatusEntity.beaten, equals(3));
      expect(addedByStatusEntity.toPlay, equals(4));
    });

    test('toJson should return a valid JSON map', () {
      final addedByStatusEntity = AddedByStatusEntity(
        yet: 1,
        owned: 2,
        beaten: 3,
        toPlay: 4,
      );

      final jsonMap = addedByStatusEntity.toJson();

      expect(jsonMap['yet'], equals(1));
      expect(jsonMap['owned'], equals(2));
      expect(jsonMap['beaten'], equals(3));
      expect(jsonMap['toPlay'], equals(4));
    });
  });

  group('TagEntity', () {
    test('fromJson should return a valid TagEntity object', () {
      final jsonMap = {
        "id": 1,
        "name": "Mock Tag",
        "slug": "mock_tag_slug",
        "language": "en",
        "gamesCount": 10,
        "imageBackground": "mock_image_url",
      };

      final tagEntity = TagEntity.fromJson(jsonMap);

      expect(tagEntity.id, equals(1));
      expect(tagEntity.name, equals("Mock Tag"));
      expect(tagEntity.slug, equals("mock_tag_slug"));
      expect(tagEntity.language, equals("en"));
      expect(tagEntity.gamesCount, equals(10));
      expect(tagEntity.imageBackground, equals("mock_image_url"));
    });

    test('toJson should return a valid JSON map', () {
      final tagEntity = TagEntity(
        id: 1,
        name: "Mock Tag",
        slug: "mock_tag_slug",
        language: "en",
        gamesCount: 10,
        imageBackground: "mock_image_url",
      );

      final jsonMap = tagEntity.toJson();

      expect(jsonMap['id'], equals(1));
      expect(jsonMap['name'], equals("Mock Tag"));
      expect(jsonMap['slug'], equals("mock_tag_slug"));
      expect(jsonMap['language'], equals("en"));
      expect(jsonMap['gamesCount'], equals(10));
      expect(jsonMap['imageBackground'], equals("mock_image_url"));
    });
  });

  group('ShortScreenshotEntity', () {
    test('fromJson should return a valid ShortScreenshotEntity object', () {
      final jsonMap = {
        "id": 1,
        "image": "mock_image_url",
      };

      final shortScreenshotEntity = ShortScreenshotEntity.fromJson(jsonMap);

      expect(shortScreenshotEntity.id, equals(1));
      expect(shortScreenshotEntity.image, equals("mock_image_url"));
    });

    test('toJson should return a valid JSON map', () {
      final shortScreenshotEntity = ShortScreenshotEntity(
        id: 1,
        image: "mock_image_url",
      );

      final jsonMap = shortScreenshotEntity.toJson();

      expect(jsonMap['id'], equals(1));
      expect(jsonMap['image'], equals("mock_image_url"));
    });
  });

  group('ParentPlatformEntity', () {
    test('fromJson should return a valid ParentPlatformEntity object', () {
      final jsonMap = {
        "platform": {
          "id": 1,
          "name": "Mock Platform",
          "slug": "mock_platform_slug",
        }
      };

      final parentPlatformEntity = ParentPlatformEntity.fromJson(jsonMap);

      expect(parentPlatformEntity.platform, isA<PlatformDetailsEntity>());
      expect(parentPlatformEntity.platform!.id, equals(1));
      expect(parentPlatformEntity.platform!.name, equals("Mock Platform"));
      expect(parentPlatformEntity.platform!.slug, equals("mock_platform_slug"));
    });

    test('toJson should return a valid JSON map', () {
      final parentPlatformEntity = ParentPlatformEntity(
        platform: PlatformDetailsEntity(
          id: 1,
          name: "Mock Platform",
          slug: "mock_platform_slug",
        ),
      );

      final jsonMap = parentPlatformEntity.toJson();

      // expect(jsonMap['platform'], isA<Map<String, dynamic>>());
      expect(jsonMap['platform'].id, equals(1));
      expect(jsonMap['platform'].name, equals("Mock Platform"));
      expect(jsonMap['platform'].slug, equals("mock_platform_slug"));
    });
  });

  group('GenreEntity', () {
    test('fromJson should return a valid GenreEntity object', () {
      final jsonMap = {
        "id": 1,
        "name": "Mock Genre",
        "slug": "mock_genre_slug",
      };

      final genreEntity = GenreEntity.fromJson(jsonMap);

      expect(genreEntity.id, equals(1));
      expect(genreEntity.name, equals("Mock Genre"));
      expect(genreEntity.slug, equals("mock_genre_slug"));
    });

    test('toJson should return a valid JSON map', () {
      final genreEntity = GenreEntity(
        id: 1,
        name: "Mock Genre",
        slug: "mock_genre_slug",
      );

      final jsonMap = genreEntity.toJson();

      expect(jsonMap['id'], equals(1));
      expect(jsonMap['name'], equals("Mock Genre"));
      expect(jsonMap['slug'], equals("mock_genre_slug"));
    });
  });
}
