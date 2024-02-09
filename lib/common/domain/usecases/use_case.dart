import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_starter_app/common/domain/failures/failure.dart';

abstract class UseCase<ReturnValue, Params extends Equatable> {
  const UseCase();

  Future<Either<Failure, ReturnValue>> call(Params param);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
