import 'package:flutter/material.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import '../cubits/display_note_cubit/notes_cubit.dart';
import 'add_note_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: buildBlocProvider(),
    );
  }

  BlocProvider<AddNoteCubit> buildBlocProvider() {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
          if (state is AddNoteFailure) {}
        },
        builder: (context, state) {
          return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: const SingleChildScrollView(child: AddNoteForm()));
        },
      ),
    );
  }
}
