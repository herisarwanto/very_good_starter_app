import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:very_good_starter_app/common/domain/failures/failure.dart';
import 'package:very_good_starter_app/common/extensions/dartz_extension.dart';

import 'package:very_good_starter_app/common/utils/constant.dart';
import 'package:very_good_starter_app/common/utils/global_helper.dart';
import 'package:very_good_starter_app/features/home/domain/entities/game_entity.dart';
import 'package:very_good_starter_app/features/home/domain/usecases/get_games.dart';

part 'home_event.dart';

part 'home_state.dart';

const _pageSize = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._getGames) : super(HomeState()) {
    on<GamesFetched>(
      _gamesFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final GetGames _getGames;
  int _page = 1;

  Future<void> _gamesFetched(
    GamesFetched event,
    Emitter<HomeState> emit,
  ) async {
    if (state.hasReachedMax) return;
    final currentDate = DateTime.now();
    final startDate = currentDate.subtract(Duration(days: 365));

    final formatCurrentDate = GlobalHelper.formatDate(currentDate);
    final formatStartDate = GlobalHelper.formatDate(startDate);

    var params = GetGamesParams(
        dates: '$formatStartDate,$formatCurrentDate',
        ordering: '-released',
        page: _page.toString(),
        pageSize: _pageSize.toString(),
        platforms: '187');

    if (state.status == StateEnum.initial) {
      final result = await _getGames.call(params);

      if (result.isRight()) {
        final games = result.getRight();
        return emit(
          state.copyWith(
            status: StateEnum.success,
            games: games,
            hasReachedMax: ((games ?? []).length < _pageSize) ? true : false,
          ),
        );
      } else {
        final data = result.getLeft() as DataFailure?;
        return emit(state.copyWith(
          status: data?.code == 404 ? StateEnum.success : StateEnum.failure,
          hasReachedMax: data?.code == 404 ? true : false,
        ));
      }
    }

    _page += 1;
    params = params.copyWith(page: _page.toString());

    final result2 = await _getGames.call(params);
    if (result2.isRight()) {
      final games = result2.getRight() ?? [];
      games.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: StateEnum.success,
                games: List.of(state.games)..addAll(games),
                hasReachedMax: false,
              ),
            );
    } else {
      final data = result2.getLeft() as DataFailure?;
      return emit(state.copyWith(
        status: data?.code == 404 ? StateEnum.success : StateEnum.failure,
        hasReachedMax: data?.code == 404 ? true : false,
      ));
    }
  }
}
