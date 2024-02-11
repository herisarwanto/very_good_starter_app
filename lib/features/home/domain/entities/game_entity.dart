import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_entity.g.dart';

@JsonSerializable()
class GameEntity extends Equatable {
  final int id;
  final String? slug;
  final String? name;
  final int? playtime;
  final List<PlatformEntity>? platforms;
  final List<StoreEntity>? stores;
  final String? released;
  final bool? tba;
  final String? backgroundImage;
  final double? rating;
  final int? ratingTop;
  final List<RatingEntity>? ratings;
  final int? ratingsCount;
  final int? reviewsTextCount;
  final int? added;
  final AddedByStatusEntity? addedByStatus;
  final int? suggestionsCount;
  final String? updated;
  final double? score;
  final dynamic clip;
  final List<TagEntity>? tags;
  final dynamic metacritic;
  final int? reviewsCount;
  final int? communityRating;
  final String? saturatedColor;
  final String? dominantColor;
  final List<ShortScreenshotEntity>? shortScreenshots;
  final List<ParentPlatformEntity>? parentPlatforms;
  final List<GenreEntity>? genres;

  const GameEntity({
    required this.id,
    this.slug,
    this.name,
    this.playtime,
    this.platforms,
    this.stores,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.addedByStatus,
    this.suggestionsCount,
    this.updated,
    this.score,
    this.clip,
    this.tags,
    this.metacritic,
    this.reviewsCount,
    this.communityRating,
    this.saturatedColor,
    this.dominantColor,
    this.shortScreenshots,
    this.parentPlatforms,
    this.genres,
  });

  factory GameEntity.fromJson(Map<String, dynamic> json) =>
      _$GameEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GameEntityToJson(this);

  @override
  List<Object?> get props => [
    id,
    slug,
    name,
    playtime,
    platforms,
    stores,
    released,
    tba,
    backgroundImage,
    rating,
    ratingTop,
    ratings,
    ratingsCount,
    reviewsTextCount,
    added,
    addedByStatus,
    suggestionsCount,
    updated,
    score,
    clip,
    tags,
    metacritic,
    reviewsCount,
    communityRating,
    saturatedColor,
    dominantColor,
    shortScreenshots,
    parentPlatforms,
    genres,
  ];
}

@JsonSerializable()
class PlatformEntity extends Equatable {
  final PlatformDetailsEntity? platform;

  const PlatformEntity({
    this.platform,
  });

  factory PlatformEntity.fromJson(Map<String, dynamic> json) =>
      _$PlatformEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlatformEntityToJson(this);

  @override
  List<Object?> get props => [platform];
}

@JsonSerializable()
class PlatformDetailsEntity extends Equatable {
  final int? id;
  final String? name;
  final String? slug;

  const PlatformDetailsEntity({
    this.id,
    this.name,
    this.slug,
  });

  factory PlatformDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$PlatformDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PlatformDetailsEntityToJson(this);

  @override
  List<Object?> get props => [id, name, slug];
}

@JsonSerializable()
class StoreEntity extends Equatable {
  final StoreDetailsEntity? store;

  const StoreEntity({
    this.store,
  });

  factory StoreEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StoreEntityToJson(this);

  @override
  List<Object?> get props => [store];
}

@JsonSerializable()
class StoreDetailsEntity extends Equatable {
  final int? id;
  final String? name;
  final String? slug;

  const StoreDetailsEntity({
    this.id,
    this.name,
    this.slug,
  });

  factory StoreDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDetailsEntityToJson(this);

  @override
  List<Object?> get props => [id, name, slug];
}

@JsonSerializable()
class RatingEntity extends Equatable {
  final int? id;
  final String? title;
  final int? count;
  final double? percent;

  const RatingEntity({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  factory RatingEntity.fromJson(Map<String, dynamic> json) =>
      _$RatingEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RatingEntityToJson(this);

  @override
  List<Object?> get props => [id, title, count, percent];
}

@JsonSerializable()
class AddedByStatusEntity extends Equatable {
  final int? yet;
  final int? owned;
  final int? beaten;
  final int? toPlay;

  const AddedByStatusEntity({
    this.yet,
    this.owned,
    this.beaten,
    this.toPlay,
  });

  factory AddedByStatusEntity.fromJson(Map<String, dynamic> json) =>
      _$AddedByStatusEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AddedByStatusEntityToJson(this);

  @override
  List<Object?> get props => [yet, owned, beaten, toPlay];
}

@JsonSerializable()
class TagEntity extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final String? language;
  final int? gamesCount;
  final String? imageBackground;

  const TagEntity({
    this.id,
    this.name,
    this.slug,
    this.language,
    this.gamesCount,
    this.imageBackground,
  });

  factory TagEntity.fromJson(Map<String, dynamic> json) =>
      _$TagEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TagEntityToJson(this);

  @override
  List<Object?> get props =>
      [id, name, slug, language, gamesCount, imageBackground];
}

@JsonSerializable()
class ShortScreenshotEntity extends Equatable {
  final int? id;
  final String? image;

  const ShortScreenshotEntity({
    this.id,
    this.image,
  });

  factory ShortScreenshotEntity.fromJson(Map<String, dynamic> json) =>
      _$ShortScreenshotEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ShortScreenshotEntityToJson(this);

  @override
  List<Object?> get props => [id, image];
}

@JsonSerializable()
class ParentPlatformEntity extends Equatable {
  final PlatformDetailsEntity? platform;

  const ParentPlatformEntity({
    this.platform,
  });

  factory ParentPlatformEntity.fromJson(Map<String, dynamic> json) =>
      _$ParentPlatformEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ParentPlatformEntityToJson(this);

  @override
  List<Object?> get props => [platform];
}

@JsonSerializable()
class GenreEntity extends Equatable {
  final int? id;
  final String? name;
  final String? slug;

  const GenreEntity({
    this.id,
    this.name,
    this.slug,
  });

  factory GenreEntity.fromJson(Map<String, dynamic> json) =>
      _$GenreEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GenreEntityToJson(this);

  @override
  List<Object?> get props => [id, name, slug];
}
