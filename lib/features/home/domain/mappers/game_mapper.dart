import 'package:very_good_starter_app/features/home/data/models/game_model.dart';
import 'package:very_good_starter_app/features/home/domain/entities/game_entity.dart';

extension GameModelMapper on GameModel {
  GameEntity toDomain() {
    return GameEntity(
      id: id,
      slug: slug,
      name: name,
      playtime: playtime,
      platforms: platforms?.map((platform) => platform.toDomain()).toList(),
      stores: stores?.map((store) => store.toDomain()).toList(),
      released: released,
      tba: tba,
      backgroundImage: backgroundImage,
      rating: rating,
      ratingTop: ratingTop,
      ratings: ratings?.map((rating) => rating.toDomain()).toList(),
      ratingsCount: ratingsCount,
      reviewsTextCount: reviewsTextCount,
      added: added,
      addedByStatus: addedByStatus?.toDomain(),
      suggestionsCount: suggestionsCount,
      updated: updated,
      score: score,
      clip: clip,
      tags: tags?.map((tag) => tag.toDomain()).toList(),
      metacritic: metacritic,
      reviewsCount: reviewsCount,
      communityRating: communityRating,
      saturatedColor: saturatedColor,
      dominantColor: dominantColor,
      shortScreenshots: shortScreenshots
          ?.map((shortScreenshot) => shortScreenshot.toDomain())
          .toList(),
      parentPlatforms: parentPlatforms
          ?.map((parentPlatform) => parentPlatform.toDomain())
          .toList(),
      genres: genres?.map((genre) => genre.toDomain()).toList(),
    );
  }
}

extension PlatformMapper on Platform {
  PlatformEntity toDomain() {
    return PlatformEntity(
      platform: platform.toDomain(),
    );
  }
}

extension PlatformDetailsMapper on PlatformDetails {
  PlatformDetailsEntity toDomain() {
    return PlatformDetailsEntity(
      id: id,
      name: name,
      slug: slug,
    );
  }
}

extension StoreMapper on Store {
  StoreEntity toDomain() {
    return StoreEntity(
      store: store.toDomain(),
    );
  }
}

extension StoreDetailsMapper on StoreDetails {
  StoreDetailsEntity toDomain() {
    return StoreDetailsEntity(
      id: id,
      name: name,
      slug: slug,
    );
  }
}

extension RatingMapper on Rating {
  RatingEntity toDomain() {
    return RatingEntity(
      id: id,
      title: title,
      count: count,
      percent: percent,
    );
  }
}

extension AddedByStatusMapper on AddedByStatus {
  AddedByStatusEntity toDomain() {
    return AddedByStatusEntity(
      yet: yet,
      owned: owned,
      beaten: beaten,
      toPlay: toPlay,
    );
  }
}

extension TagMapper on Tag {
  TagEntity toDomain() {
    return TagEntity(
      id: id,
      name: name,
      slug: slug,
      language: language,
      gamesCount: gamesCount,
      imageBackground: imageBackground,
    );
  }
}

extension ShortScreenshotMapper on ShortScreenshot {
  ShortScreenshotEntity toDomain() {
    return ShortScreenshotEntity(
      id: id,
      image: image,
    );
  }
}

extension ParentPlatformMapper on ParentPlatform {
  ParentPlatformEntity toDomain() {
    return ParentPlatformEntity(
      platform: platform.toDomain(),
    );
  }
}

extension GenreMapper on Genre {
  GenreEntity toDomain() {
    return GenreEntity(
      id: id,
      name: name,
      slug: slug,
    );
  }
}
