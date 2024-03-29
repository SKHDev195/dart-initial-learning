import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/1_domain/entities/todo_collection.dart';
import 'package:todo_app/1_domain/entities/todo_color.dart';
import 'package:todo_app/1_domain/use_cases/create_todo_collection.dart';
import 'package:todo_app/core/use_case.dart';

part 'create_to_do_collection_page_cubit_state.dart';

class CreateToDoCollectionPageCubit
    extends Cubit<CreateToDoCollectionPageCubitState> {
  CreateToDoCollectionPageCubit({
    required this.createToDoCollection,
  }) : super(const CreateToDoCollectionPageCubitState());

  final CreateToDoCollection createToDoCollection;

  void titleChanged(String title) {
    emit(
      state.copyWith(title: title),
    );
  }

  void colorChanged(Color color) {
    emit(
      state.copyWith(color: color),
    );
  }

  Future<void> submit() async {
    int chosenColorIndex = ToDoColor.predefinedColors
        .indexWhere((element) => element.value == state.color?.value);
    if (chosenColorIndex == -1) {
      chosenColorIndex = 0;
    }
    await createToDoCollection.call(
      ToDoCollectionParams(
        collection: ToDoCollection.empty().copyWith(
          title: state.title,
          todoColor: ToDoColor(
            colorIndex: chosenColorIndex,
          ),
        ),
      ),
    );
  }
}
