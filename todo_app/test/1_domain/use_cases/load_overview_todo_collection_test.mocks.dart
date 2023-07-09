// Mocks generated by Mockito 5.4.2 from annotations
// in todo_app/test/1_domain/use_cases/load_overview_todo_collection_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:either_dart/either.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:todo_app/0_data/repositories/todo_repository_mock.dart' as _i3;
import 'package:todo_app/1_domain/entities/todo_collection.dart' as _i5;
import 'package:todo_app/1_domain/entities/todo_entry.dart' as _i4;
import 'package:todo_app/1_domain/entities/unique_id.dart' as _i8;
import 'package:todo_app/1_domain/failures/failure.dart' as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ToDoRepositoryMock].
///
/// See the documentation for Mockito's code generation for more information.
class MockToDoRepositoryMock extends _i1.Mock
    implements _i3.ToDoRepositoryMock {
  @override
  List<_i4.ToDoEntry> get toDoEntries => (super.noSuchMethod(
        Invocation.getter(#toDoEntries),
        returnValue: <_i4.ToDoEntry>[],
        returnValueForMissingStub: <_i4.ToDoEntry>[],
      ) as List<_i4.ToDoEntry>);
  @override
  List<_i5.ToDoCollection> get toDoCollections => (super.noSuchMethod(
        Invocation.getter(#toDoCollections),
        returnValue: <_i5.ToDoCollection>[],
        returnValueForMissingStub: <_i5.ToDoCollection>[],
      ) as List<_i5.ToDoCollection>);
  @override
  _i6.Future<
      _i2.Either<_i7.Failure,
          List<_i5.ToDoCollection>>> readToDoCollections() =>
      (super.noSuchMethod(
        Invocation.method(
          #readToDoCollections,
          [],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i5.ToDoCollection>>>.value(
                _FakeEither_0<_i7.Failure, List<_i5.ToDoCollection>>(
          this,
          Invocation.method(
            #readToDoCollections,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.Either<_i7.Failure, List<_i5.ToDoCollection>>>.value(
                _FakeEither_0<_i7.Failure, List<_i5.ToDoCollection>>(
          this,
          Invocation.method(
            #readToDoCollections,
            [],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i5.ToDoCollection>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i4.ToDoEntry>> readToDoEntry(
    _i8.CollectionId? collectionId,
    _i8.EntryId? entryId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #readToDoEntry,
          [
            collectionId,
            entryId,
          ],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i4.ToDoEntry>>.value(
            _FakeEither_0<_i7.Failure, _i4.ToDoEntry>(
          this,
          Invocation.method(
            #readToDoEntry,
            [
              collectionId,
              entryId,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.Either<_i7.Failure, _i4.ToDoEntry>>.value(
                _FakeEither_0<_i7.Failure, _i4.ToDoEntry>(
          this,
          Invocation.method(
            #readToDoEntry,
            [
              collectionId,
              entryId,
            ],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i4.ToDoEntry>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i8.EntryId>>> readToDoEntryIds(
          _i8.CollectionId? collectionId) =>
      (super.noSuchMethod(
        Invocation.method(
          #readToDoEntryIds,
          [collectionId],
        ),
        returnValue:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.EntryId>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.EntryId>>(
          this,
          Invocation.method(
            #readToDoEntryIds,
            [collectionId],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.Either<_i7.Failure, List<_i8.EntryId>>>.value(
                _FakeEither_0<_i7.Failure, List<_i8.EntryId>>(
          this,
          Invocation.method(
            #readToDoEntryIds,
            [collectionId],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, List<_i8.EntryId>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i4.ToDoEntry>> updateToDoEntry({
    required _i8.CollectionId? collectionId,
    required _i8.EntryId? entryId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateToDoEntry,
          [],
          {
            #collectionId: collectionId,
            #entryId: entryId,
          },
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, _i4.ToDoEntry>>.value(
            _FakeEither_0<_i7.Failure, _i4.ToDoEntry>(
          this,
          Invocation.method(
            #updateToDoEntry,
            [],
            {
              #collectionId: collectionId,
              #entryId: entryId,
            },
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.Either<_i7.Failure, _i4.ToDoEntry>>.value(
                _FakeEither_0<_i7.Failure, _i4.ToDoEntry>(
          this,
          Invocation.method(
            #updateToDoEntry,
            [],
            {
              #collectionId: collectionId,
              #entryId: entryId,
            },
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, _i4.ToDoEntry>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, bool>> createToDoCollection(
          _i5.ToDoCollection? collection) =>
      (super.noSuchMethod(
        Invocation.method(
          #createToDoCollection,
          [collection],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, bool>>.value(
            _FakeEither_0<_i7.Failure, bool>(
          this,
          Invocation.method(
            #createToDoCollection,
            [collection],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.Either<_i7.Failure, bool>>.value(
                _FakeEither_0<_i7.Failure, bool>(
          this,
          Invocation.method(
            #createToDoCollection,
            [collection],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, bool>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, bool>> createToDoEntry(
          _i4.ToDoEntry? entry) =>
      (super.noSuchMethod(
        Invocation.method(
          #createToDoEntry,
          [entry],
        ),
        returnValue: _i6.Future<_i2.Either<_i7.Failure, bool>>.value(
            _FakeEither_0<_i7.Failure, bool>(
          this,
          Invocation.method(
            #createToDoEntry,
            [entry],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i2.Either<_i7.Failure, bool>>.value(
                _FakeEither_0<_i7.Failure, bool>(
          this,
          Invocation.method(
            #createToDoEntry,
            [entry],
          ),
        )),
      ) as _i6.Future<_i2.Either<_i7.Failure, bool>>);
}
