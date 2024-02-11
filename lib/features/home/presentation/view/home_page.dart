import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_starter_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:very_good_starter_app/features/home/presentation/view/games_list.dart';
import 'package:very_good_starter_app/injector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;
  @override
  void initState() {
    _homeBloc = getIt<HomeBloc>();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _homeBloc..add(GamesFetched()),
        child: GamesList(),
      ),
    );
  }
}
