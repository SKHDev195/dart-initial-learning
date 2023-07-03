import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';
import 'package:todo_app/1_domain/use_cases/create_todo_entry.dart';
import 'package:todo_app/2_application/core/form_value.dart';
import 'package:todo_app/2_application/core/page_config.dart';
import 'package:todo_app/2_application/pages/create_todo_entry/bloc/cubit/create_to_do_entry_page_cubit.dart';

class CreateToDoEntryPageProvider extends StatefulWidget {
  const CreateToDoEntryPageProvider({
    super.key,
    required this.collectionId,
  });

  final CollectionId collectionId;

  @override
  State<CreateToDoEntryPageProvider> createState() =>
      _CreateToDoEntryPageProviderState();
}

class _CreateToDoEntryPageProviderState
    extends State<CreateToDoEntryPageProvider> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateToDoEntryPageCubit>(
      create: (context) => CreateToDoEntryPageCubit(
        collectionId: widget.collectionId,
        createToDoEntry: CreateToDoEntry(
          toDoRepository: RepositoryProvider.of<ToDoRepository>(context),
        ),
      ),
      child: CreateToDoEntryPage(),
    );
  }
}

class CreateToDoEntryPage extends StatelessWidget {
  CreateToDoEntryPage({
    super.key,
  });

  static const pageConfig = PageConfig(
    icon: Icons.task_alt_rounded,
    name: 'create_todo_entry',
    child: Placeholder(),
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
              onChanged: (value) => context
                  .read<CreateToDoEntryPageCubit>()
                  .descriptionChanged(value),
              validator: (value) {
                final currentValidationState = context
                        .read<CreateToDoEntryPageCubit>()
                        .state
                        .description
                        ?.validationStatus ??
                    ValidationStatus.pending;

                switch (currentValidationState) {
                  case ValidationStatus.error:
                    return 'This field needs at least two characters to be valid';
                  case ValidationStatus.success:
                  case ValidationStatus.pending:
                    return null;
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                final isValid = _formKey.currentState?.validate();

                if (isValid == true) {
                  context.read<CreateToDoEntryPageCubit>().submit();
                  context.pop();
                }
              },
              child: const Text('Save Entry'),
            )
          ],
        ),
      ),
    );
  }
}
