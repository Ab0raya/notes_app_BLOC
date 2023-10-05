import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:intl/intl.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';
import 'note_colors_list.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title, desc;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Add Note',
            style: TextStyle(
              fontSize: 38,
            ),
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          CustomTextField(
            onSaved: (value) {
              desc = value;
            },
            hint: 'Content',
            lines: 5,
          ),
          const ColorsCirclesList(),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: onTapAction,
              );

            },
          ),
        ],
      ),
    );
  }
  onTapAction(){
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var noteModel = NoteModel(title: title!,
        desc: desc!,
        date: DateFormat('MMM d, y').format(DateTime.now()),
        color: Colors.blueAccent.value,);
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
    } else {
      autovalidateMode = AutovalidateMode.always;

    }
  }
}

