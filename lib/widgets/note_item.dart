import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/display_note_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> EditNoteView(note: note,)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24), color:  Color(note.color)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                title:  Text(
                 note.title,
                  style: const TextStyle(fontSize: 26, color: Colors.black),
                ),
                subtitle: Text(
                  note.desc,
                  style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.4)),
                ),
                trailing: IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 40,
                    )),
              ),
              Text(
                note.date,
                style: TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.4)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
