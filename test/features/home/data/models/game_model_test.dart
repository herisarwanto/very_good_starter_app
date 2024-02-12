import 'package:test/test.dart';
import 'package:very_good_starter_app/features/home/data/models/game_model.dart';

void main() {
  group('GameModel', () {
    test('toJson should return a valid JSON map', () {
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

      final jsonMap = gameModel.toJson();

      expect(jsonMap, isA<Map<String, dynamic>>());
      // Add additional assertions here based on the expected JSON structure
    });

    test('fromJson should return a valid GameModel object', () {
      final jsonMap = {
        "slug": "helldivers-ii",
        "name": "Helldivers II",
        "playtime": 0,
        "platforms": [
          {
            "platform": {"id": 4, "name": "PC", "slug": "pc"}
          },
          {
            "platform": {
              "id": 187,
              "name": "PlayStation 5",
              "slug": "playstation5"
            }
          }
        ],
        "stores": [
          {
            "store": {"id": 1, "name": "Steam", "slug": "steam"}
          },
          {
            "store": {
              "id": 3,
              "name": "PlayStation Store",
              "slug": "playstation-store"
            }
          }
        ],
        "released": "2024-02-08",
        "tba": false,
        "background_image":
            "https://media.rawg.io/media/games/cbb/cbb9480547e9770383e3af1ab9dd3be3.jpg",
        "rating": 0.0,
        "rating_top": 0,
        "ratings": [
          {"id": 5, "title": "exceptional", "count": 2, "percent": 66.67},
          {"id": 3, "title": "meh", "count": 1, "percent": 33.33}
        ],
        "ratings_count": 2,
        "reviews_text_count": 1,
        "added": 55,
        "added_by_status": {
          "yet": 10,
          "owned": 9,
          "toplay": 31,
          "dropped": 2,
          "playing": 3
        },
        "metacritic": null,
        "suggestions_count": 302,
        "updated": "2024-02-10T18:13:57",
        "id": 961204,
        "score": null,
        "clip": null,
        "tags": [],
        "esrb_rating": {
          "id": 4,
          "name": "Mature",
          "slug": "mature",
          "name_en": "Mature",
          "name_ru": "С 17 лет"
        },
        "user_game": null,
        "reviews_count": 3,
        "community_rating": 0,
        "saturated_color": "0f0f0f",
        "dominant_color": "0f0f0f",
        "short_screenshots": [
          {
            "id": -1,
            "image":
                "https://media.rawg.io/media/games/cbb/cbb9480547e9770383e3af1ab9dd3be3.jpg"
          },
          {
            "id": 3888356,
            "image":
                "https://media.rawg.io/media/screenshots/842/8425a3fde98fbabc0e7d9179c33b62af.jpg"
          },
          {
            "id": 3888357,
            "image":
                "https://media.rawg.io/media/screenshots/4c8/4c8f360c605d3e50953b9d42c81f258b.jpg"
          },
          {
            "id": 3888358,
            "image":
                "https://media.rawg.io/media/screenshots/3fd/3fd75b889748e77a345bdd46c7051740.jpg"
          },
          {
            "id": 3888359,
            "image":
                "https://media.rawg.io/media/screenshots/aec/aecf3d7f5f20ad03f24b04929354b90e.jpg"
          },
          {
            "id": 3888360,
            "image":
                "https://media.rawg.io/media/screenshots/420/4201d03a706fd321999956d529bcc376.jpg"
          }
        ],
        "parent_platforms": [
          {
            "platform": {"id": 1, "name": "PC", "slug": "pc"}
          },
          {
            "platform": {"id": 2, "name": "PlayStation", "slug": "playstation"}
          }
        ],
        "genres": [
          {"id": 4, "name": "Action", "slug": "action"}
        ]
      };

      final gameModel = GameModel.fromJson(jsonMap);

      expect(gameModel, isA<GameModel>());
      // Add additional assertions here based on the expected GameModel object
    });
  });
}
