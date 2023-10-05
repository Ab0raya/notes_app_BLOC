import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import '../../constants.dart';
import '../../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  fetchAllNotes() async {
    var notesBoxes = Hive.box<NoteModel>(kNotesBox);
    notes = notesBoxes.values.toList();
    emit(NotesSuccess());
  }
}
