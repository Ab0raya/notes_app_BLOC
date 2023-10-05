import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';
import '../cubits/display_note_cubit/notes_cubit.dart';
import 'custom_text_field.dart';
import 'edit_note_app_bar.dart';
import 'edit_notes_colors_list.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? editedTitle,editedDesc;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
      child: Column(
        children: [
          EditNoteAppBar(
            onTap: () {
              widget.note.title = editedTitle ?? widget.note.title;
              widget.note.desc = editedDesc ?? widget.note.desc;
              widget.note.save();
              Navigator.pop(context);
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            },
          ),
           CustomTextField(
             initialValue:widget.note.title ,
            onChanged: (value){
              editedTitle = value ;
            },
            hint: 'Title',
          ),
           CustomTextField(
             initialValue: widget.note.desc,
             onChanged: (value){
               editedDesc = value ;
             },
            hint: 'Content',
            lines: 8,
          ),
           EditNoteColorsList(note: widget.note,),
        ],
      ),
    );
  }
}

