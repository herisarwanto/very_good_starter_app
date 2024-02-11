import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class DataFailure extends Failure {
  DataFailure({
    this.code = -1,
    this.message = 'Unknown Error',
  });

  final int? code;

  final String? message;

  @override
  List<Object> get props => [code!, message!];
}
