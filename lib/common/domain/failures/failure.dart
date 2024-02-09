import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class DataFailure extends Failure {
  DataFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
