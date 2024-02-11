import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_starter_app/common/domain/failures/failure.dart';
import 'package:very_good_starter_app/common/domain/usecases/use_case.dart';
import 'package:very_good_starter_app/features/home/domain/entities/game_entity.dart';
import 'package:very_good_starter_app/features/home/domain/repositories/game_repository.dart';

@injectable
class GetGames extends UseCase<List<GameEntity>, GetGamesParams> {
  const GetGames(this._gameRepository);

  final GameRepository _gameRepository;

  @override
  Future<Either<Failure, List<GameEntity>>> call(GetGamesParams param) =>
      _gameRepository.getGames(
          dates: param.dates,
          ordering: param.ordering,
          page: param.page,
          pageSize: param.pageSize,
          platforms: param.platforms);
}

@immutable
class GetGamesParams extends Equatable {
  final String dates;
  final String ordering;
  final String page;
  final String pageSize;
  final String platforms;

  const GetGamesParams({
    required this.dates,
    required this.ordering,
    required this.page,
    required this.pageSize,
    required this.platforms,
  });

  @override
  List<Object> get props => [dates, ordering, page, pageSize, platforms];

  GetGamesParams copyWith({
    String? dates,
    String? ordering,
    String? page,
    String? pageSize,
    String? platforms,
  }) {
    return GetGamesParams(
      dates: dates ?? this.dates,
      ordering: ordering ?? this.ordering,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      platforms: platforms ?? this.platforms,
    );
  }
}
