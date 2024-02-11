import 'package:dartz/dartz.dart';
import 'package:very_good_starter_app/common/domain/failures/failure.dart';
import 'package:very_good_starter_app/features/home/domain/entities/game_entity.dart';

abstract class GameRepository {
  Future<Either<Failure, List<GameEntity>>> getGames(
      {required String dates,
      required String ordering,
      required String page,
      required String pageSize,
      required String platforms});
}
