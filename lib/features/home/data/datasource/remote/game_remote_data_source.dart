import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:very_good_starter_app/common/domain/failures/failure.dart';
import 'package:very_good_starter_app/common/utils/global_helper.dart';
import 'package:very_good_starter_app/common/utils/name_constant.dart';
import 'package:very_good_starter_app/common/utils/url_constant.dart';
import 'package:very_good_starter_app/features/home/data/models/game_model.dart';

sealed class GameRemoteDataSource {
  Future<Either<Failure, List<GameModel>>> getGames(
      {required String dates,
      required String ordering,
      required String page,
      required String pageSize,
      required String platforms});
}

@LazySingleton(as: GameRemoteDataSource)
class GameRemoteDataSourceImpl implements GameRemoteDataSource {
  final Dio dio;

  GameRemoteDataSourceImpl(@Named(NameConstant.publicDio) this.dio);

  @override
  Future<Either<Failure, List<GameModel>>> getGames(
      {required String dates,
      required String ordering,
      required String page,
      required String pageSize,
      required String platforms}) async {
    try {
      final query = {
        'page': page,
        'page_size': pageSize,
        'platforms': platforms,
        'dates': dates,
        'ordering': ordering,
        'key': UrlConstant.apiKey,
      };

      final response = await dio.get<dynamic>(
        UrlConstant.gamesUrl,
        queryParameters: query,
      );

      if (GlobalHelper.isSuccessStatus(response.statusCode)) {
        final games = response.data['results'] as List? ?? [];
        final result = List<GameModel>.from(
            games.map((e) => GameModel.fromJson(e as Map<String, dynamic>)));
        return right(result);
      }

      return left(DataFailure(
          code: response.statusCode, message: response.statusMessage));
    } catch (e, stackTrace) {
      log(e.toString(), name: runtimeType.toString(), stackTrace: stackTrace);
      final error = GlobalHelper.errorResponseData(e);
      return left(DataFailure(code: error.statusCode, message: error.message));
    }
  }
}
