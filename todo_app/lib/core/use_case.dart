import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/1_domain/failures/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {}

abstract class NoParams extends Params {
  @override
  List<Object?> get props => [];
}

class MockNoParams extends NoParams {}
