import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/failures/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}

class ToDoEntryIdsParams extends Params {
  ToDoEntryIdsParams({
    required this.collectionId,
    required this.entryId,
  }) : super();

  final EntryId entryId;
  final CollectionId collectionId;

  @override
  List<Object?> get props => [
        entryId,
        collectionId,
      ];
}

class CollectionIdParams extends Params {
  CollectionIdParams({
    required this.collectionId,
  }) : super();

  final CollectionId collectionId;

  @override
  List<Object?> get props => [
        collectionId,
      ];
}