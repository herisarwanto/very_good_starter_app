import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel extends Equatable {
  final String? slug;
  final String? name;
  final int? playtime;
  final List<Platform>? platforms;
  final List<Store>? stores;
  final String? released;
  final bool? tba;
  @JsonKey(name: 'background_image')
  final String? backgroundImage;
  final double? rating;
  @JsonKey(name: 'rating_top')
  final int? ratingTop;
  final List<Rating>? ratings;
  @JsonKey(name: 'ratings_count')
  final int? ratingsCount;
  @JsonKey(name: 'reviews_text_count')
  final int? reviewsTextCount;
  final int? added;
  @JsonKey(name: 'added_by_status')
  final AddedByStatus? addedByStatus;
  @JsonKey(name: 'suggestions_count')
  final int? suggestionsCount;
  final String? updated;
  final int id;
  final double? score;
  final dynamic clip;
  final List<Tag>? tags;
  final dynamic metacritic;
  @JsonKey(name: 'reviews_count')
  final int? reviewsCount;
  @JsonKey(name: 'community_rating')
  final int? communityRating;
  @JsonKey(name: 'saturated_color')
  final String? saturatedColor;
  @JsonKey(name: 'dominant_color')
  final String? dominantColor;
  @JsonKey(name: 'short_screenshots')
  final List<ShortScreenshot>? shortScreenshots;
  @JsonKey(name: 'parent_platforms')
  final List<ParentPlatform>? parentPlatforms;
  final List<Genre>? genres;

  const GameModel({
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
    required this.id,
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

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);

  @override
  List<Object?> get props => [
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
        id,
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
class Platform extends Equatable {
  final PlatformDetails platform;

  const Platform({
    required this.platform,
  });

  factory Platform.fromJson(Map<String, dynamic> json) =>
      _$PlatformFromJson(json);

  Map<String, dynamic> toJson() => _$PlatformToJson(this);

  @override
  List<Object?> get props => [platform];
}

@JsonSerializable()
class PlatformDetails extends Equatable {
  final int? id;
  final String? name;
  final String? slug;

  const PlatformDetails({
    this.id,
    this.name,
    this.slug,
  });

  factory PlatformDetails.fromJson(Map<String, dynamic> json) =>
      _$PlatformDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PlatformDetailsToJson(this);

  @override
  List<Object?> get props => [id, name, slug];
}

@JsonSerializable()
class Store extends Equatable {
  final StoreDetails store;

  const Store({
    required this.store,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);

  @override
  List<Object?> get props => [store];
}

@JsonSerializable()
class StoreDetails extends Equatable {
  final int? id;
  final String? name;
  final String? slug;

  const StoreDetails({
    this.id,
    this.name,
    this.slug,
  });

  factory StoreDetails.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDetailsToJson(this);

  @override
  List<Object?> get props => [id, name, slug];
}

@JsonSerializable()
class Rating extends Equatable {
  final int? id;
  final String? title;
  final int? count;
  final double? percent;

  const Rating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);

  @override
  List<Object?> get props => [id, title, count, percent];
}

@JsonSerializable()
class AddedByStatus extends Equatable {
  final int? yet;
  final int? owned;
  final int? beaten;
  final int? toPlay;

  const AddedByStatus({
    this.yet,
    this.owned,
    this.beaten,
    this.toPlay,
  });

  factory AddedByStatus.fromJson(Map<String, dynamic> json) =>
      _$AddedByStatusFromJson(json);

  Map<String, dynamic> toJson() => _$AddedByStatusToJson(this);

  @override
  List<Object?> get props => [yet, owned, beaten, toPlay];
}

@JsonSerializable()
class Tag extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final String? language;
  final int? gamesCount;
  final String? imageBackground;

  const Tag({
    this.id,
    this.name,
    this.slug,
    this.language,
    this.gamesCount,
    this.imageBackground,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);

  @override
  List<Object?> get props =>
      [id, name, slug, language, gamesCount, imageBackground];
}

@JsonSerializable()
class ShortScreenshot extends Equatable {
  final int? id;
  final String? image;

  const ShortScreenshot({
    this.id,
    this.image,
  });

  factory ShortScreenshot.fromJson(Map<String, dynamic> json) =>
      _$ShortScreenshotFromJson(json);

  Map<String, dynamic> toJson() => _$ShortScreenshotToJson(this);

  @override
  List<Object?> get props => [id, image];
}

@JsonSerializable()
class ParentPlatform extends Equatable {
  final PlatformDetails platform;

  const ParentPlatform({
    required this.platform,
  });

  factory ParentPlatform.fromJson(Map<String, dynamic> json) =>
      _$ParentPlatformFromJson(json);

  Map<String, dynamic> toJson() => _$ParentPlatformToJson(this);

  @override
  List<Object?> get props => [platform];
}

@JsonSerializable()
class Genre extends Equatable {
  final int? id;
  final String? name;
  final String? slug;

  const Genre({
    this.id,
    this.name,
    this.slug,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);

  @override
  List<Object?> get props => [id, name, slug];
}
