import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_starter_app/common/utils/constant.dart';
import 'package:very_good_starter_app/features/home/domain/entities/game_entity.dart';
import 'package:very_good_starter_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:very_good_starter_app/features/home/presentation/view/games_list.dart';
import 'package:very_good_starter_app/features/home/presentation/widgets/bottom_loader.dart';
import 'package:very_good_starter_app/features/home/presentation/widgets/game_list_item.dart';

class MockPostBloc extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

extension on WidgetTester {
  Future<void> pumpPostsList(HomeBloc homeBloc) {
    return pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: homeBloc,
          child: GamesList(),
        ),
      ),
    );
  }
}

void main() {
  final mockGames = List.generate(
    5,
    (i) => GameEntity(id: i, name: 'game name', metacritic: 90),
  );

  late HomeBloc homeBloc;

  setUp(() {
    homeBloc = MockPostBloc();
  });

  group('GamesList', () {
    testWidgets(
        'renders CircularProgressIndicator '
        'when game status is initial', (tester) async {
      when(() => homeBloc.state).thenReturn(const HomeState());
      await tester.pumpPostsList(homeBloc);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'renders no games text '
        'when game status is success but with 0 posts', (tester) async {
      when(() => homeBloc.state).thenReturn(
        const HomeState(status: StateEnum.success, hasReachedMax: true),
      );
      await tester.pumpPostsList(homeBloc);
      expect(find.text('no posts'), findsOneWidget);
    });

    testWidgets(
        'renders 5 games and a bottom loader when post max is not reached yet',
        (tester) async {
      when(() => homeBloc.state).thenReturn(
        HomeState(
          status: StateEnum.success,
          games: mockGames,
        ),
      );
      await tester.pumpPostsList(homeBloc);
      expect(find.byType(GameListItem), findsNWidgets(5));
      expect(find.byType(BottomLoader), findsOneWidget);
    });

    testWidgets('does not render bottom loader when game max is reached',
        (tester) async {
      when(() => homeBloc.state).thenReturn(
        HomeState(
          status: StateEnum.success,
          games: mockGames,
          hasReachedMax: true,
        ),
      );
      await tester.pumpPostsList(homeBloc);
      expect(find.byType(BottomLoader), findsNothing);
    });

    testWidgets('fetches more games when scrolled to the bottom',
        (tester) async {
      when(() => homeBloc.state).thenReturn(
        HomeState(
          status: StateEnum.success,
          games: List.generate(
            10,
            (i) => GameEntity(id: i, name: 'game name', metacritic: 90),
          ),
        ),
      );
      await tester.pumpPostsList(homeBloc);
      await tester.drag(find.byType(GamesList), const Offset(0, -500));
      verify(() => homeBloc.add(GamesFetched())).called(1);
    });
  });
}
