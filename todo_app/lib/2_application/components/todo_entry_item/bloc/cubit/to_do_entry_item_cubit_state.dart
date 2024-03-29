part of 'to_do_entry_item_cubit.dart';

@immutable
abstract class ToDoEntryItemCubitState extends Equatable {
  @override
  List<Object> get props => [];
}

class ToDoEntryItemCubitLoadingState extends ToDoEntryItemCubitState {}

class ToDoEntryItemCubitLoadedState extends ToDoEntryItemCubitState {
  ToDoEntryItemCubitLoadedState({
    required this.toDoEntry,
  });

  final ToDoEntry toDoEntry;

  @override
  List<Object> get props => [
        toDoEntry,
      ];
}

class ToDoEntryItemCubitErrorState extends ToDoEntryItemCubitState {}
