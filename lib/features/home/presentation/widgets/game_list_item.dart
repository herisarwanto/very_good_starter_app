import 'package:flutter/material.dart';
import 'package:very_good_starter_app/features/home/domain/entities/game_entity.dart';

class GameListItem extends StatelessWidget {
  const GameListItem({required this.game, super.key});

  final GameEntity game;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${game.id}', style: textTheme.bodySmall),
        title: Text(game.name ?? ''),
        isThreeLine: true,
        subtitle: Text(game.slug ?? ''),
        dense: true,
      ),
    );
  }
}
