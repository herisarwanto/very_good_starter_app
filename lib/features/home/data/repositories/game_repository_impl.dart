import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_starter_app/common/domain/failures/failure.dart';
import 'package:very_good_starter_app/features/home/data/datasource/remote/game_remote_data_source.dart';
import 'package:very_good_starter_app/features/home/domain/entities/game_entity.dart';
import 'package:very_good_starter_app/features/home/domain/mappers/game_mapper.dart';
import 'package:very_good_starter_app/features/home/domain/repositories/game_repository.dart';

@LazySingleton(as: GameRepository)
class GameRepositoryImpl implements GameRepository {
  GameRepositoryImpl(this._dataSource);

  final GameRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, List<GameEntity>>> getGames(
          {required String dates,
          required String ordering,
          required String page,
          required String pageSize,
          required String platforms}) =>
      _dataSource
          .getGames(
              dates: dates,
              ordering: ordering,
              page: page,
              pageSize: pageSize,
              platforms: platforms)
          .then((games) =>
              games.map((r) => r.map((game) => game.toDomain()).toList()));
}
